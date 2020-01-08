/* Class adaption of Optical Flow by Hidetoshi Shimodaira (shimo@is.titech.ac.jp)
   http://www.openprocessing.org/sketch/10435  2010 GPL
   Adapted for USC IML 404.  do not delete this reference, required for posting your code  
*/ 

import processing.video.*;

class ShimodairaOpticalFlow {

  Capture cam;
  PFont font;
  color[] vline; //array to store a single horizontal line of pixels when mirroring the image

  // opticl flow
  int gs=10; // grid step (pixels)
  float predsec=1.0; // prediction time (sec): larger for longer vector

  // frames per second
  int fps=30;

  int as=gs*2;  // window size for averaging (-as,...,+as)
  int gw; //=width/gs;
  int gh; //=height/gs;
  int gs2=gs/2;
  float df=predsec*fps;

  // regression vectors
  float[] fx, fy, ft;
  int fm=3*9; // length of the vectors

  // regularization term for regression
  float fc=pow(10, 8); // larger values for noisy cam

  // smoothing parameters
  float wflow=0.1; // smaller value for longer smoothing

  // switch
  //boolean flagseg=false; // segmentation of moving objects?
  boolean flagmirror=true; // mirroring image?
  boolean flagflow=false; // draw opticalflow vectors?
  boolean flagimage=true; // show cam image ?

  // internally used variables
  float ar, ag, ab; // used as return value of pixave
  float[] dtr, dtg, dtb; // differentiation by t (red,gree,blue)
  float[] dxr, dxg, dxb; // differentiation by x (red,gree,blue)
  float[] dyr, dyg, dyb; // differentiation by y (red,gree,blue)
  float[] par, pag, pab; // averaged grid values (red,gree,blue)
  float[] flowx, flowy; // computed optical flow
  float[] sflowx, sflowy; // slowly changing version of the flow
  int clockNow, clockPrev, clockDiff; // for timing check
  
  ArrayList<PVector> flows = new ArrayList<PVector>();
  ArrayList<PVector> flows_color = new ArrayList<PVector>();


  ShimodairaOpticalFlow(Capture camera) {
    cam = camera;

    gw=cam.width/gs;
    gh=cam.height/gs;

    // arrays
    par = new float[gw*gh];
    pag = new float[gw*gh];
    pab = new float[gw*gh];
    dtr = new float[gw*gh];
    dtg = new float[gw*gh];
    dtb = new float[gw*gh];
    dxr = new float[gw*gh];
    dxg = new float[gw*gh];
    dxb = new float[gw*gh];
    dyr = new float[gw*gh];
    dyg = new float[gw*gh];
    dyb = new float[gw*gh];
    flowx = new float[gw*gh];
    flowy = new float[gw*gh];
    sflowx = new float[gw*gh];
    sflowy = new float[gw*gh];
    fx = new float[fm];
    fy = new float[fm];
    ft = new float[fm];
    vline = new color[cam.width];
  }

  // calculate average pixel value (r,g,b) for rectangle region
  void pixave(int x1, int y1, int x2, int y2) {
    float sumr, sumg, sumb;
    color pix;
    int r, g, b;
    int n;

    if (x1<0) x1=0;
    if (x2>=cam.width) x2=cam.width-1;
    if (y1<0) y1=0;
    if (y2>=cam.height) y2=cam.height-1;

    sumr=sumg=sumb=0.0;
    for (int y=y1; y<=y2; y++) {
      for (int i=cam.width*y+x1; i<=cam.width*y+x2; i++) {
        pix=cam.pixels[i];
        b=pix & 0xFF; // blue
        pix = pix >> 8;
        g=pix & 0xFF; // green
        pix = pix >> 8;
        r=pix & 0xFF; // red
        // averaging the values
        sumr += r;
        sumg += g;
        sumb += b;
      }
    }
    n = (x2-x1+1)*(y2-y1+1); // number of pixels
    // the results are stored in static variables
    ar = sumr/n; 
    ag=sumg/n; 
    ab=sumb/n;
  }

  // extract values from 9 neighbour grids
  void getnext9(float x[], float y[], int i, int j) {
    y[j+0] = x[i+0];
    y[j+1] = x[i-1];
    y[j+2] = x[i+1];
    y[j+3] = x[i-gw];
    y[j+4] = x[i+gw];
    y[j+5] = x[i-gw-1];
    y[j+6] = x[i-gw+1];
    y[j+7] = x[i+gw-1];
    y[j+8] = x[i+gw+1];
  }

  // solve optical flow by least squares (regression analysis)
  void solveflow(int ig) {
    float xx, xy, yy, xt, yt;
    float a, u, v, w;

    // prepare covariances
    xx=xy=yy=xt=yt=0.0;
    for (int i=0; i<fm; i++) {
      xx += fx[i]*fx[i];
      xy += fx[i]*fy[i];
      yy += fy[i]*fy[i];
      xt += fx[i]*ft[i];
      yt += fy[i]*ft[i];
    }

    // least squares computation
    a = xx*yy - xy*xy + fc; // fc is for stable computation
    u = yy*xt - xy*yt; // x direction
    v = xx*yt - xy*xt; // y direction

    // write back
    flowx[ig] = -2*gs*u/a; // optical flow x (pixel per frame)
    flowy[ig] = -2*gs*v/a; // optical flow y (pixel per frame)
  }


  void calculateFlow() {
    if (cam.available() == true) {
      cam.read();
      cam.loadPixels(); // p3D requires this, works fine w/out in 2D

      // clock in msec
      clockNow = millis();
      clockDiff = clockNow - clockPrev;
      clockPrev = clockNow;

      // mirror
      if (flagmirror) {
        for (int y=0; y<cam.height; y++) {
          int ig=y*cam.width;
          for (int x=0; x<cam.width; x++) 
            vline[x] = cam.pixels[ig+x];
          for (int x=0; x<cam.width; x++) 
            cam.pixels[ig+x]=vline[cam.width-1-x];
        }
      }
      cam.updatePixels(); // p3D requires this, works fine w/out in 2D

      // 1st sweep : differentiation by time
      for (int ix=0; ix<gw; ix++) {
        int x0=ix*gs+gs2;
        for (int iy=0; iy<gh; iy++) {
          int y0=iy*gs+gs2;
          int ig=iy*gw+ix;
          // compute average pixel at (x0,y0)
          pixave(x0-as, y0-as, x0+as, y0+as);
          // compute time difference
          dtr[ig] = ar-par[ig]; // red
          dtg[ig] = ag-pag[ig]; // green
          dtb[ig] = ab-pab[ig]; // blue
          // save the pixel
          par[ig]=ar;
          pag[ig]=ag;
          pab[ig]=ab;
        }
      }

      // 2nd sweep : differentiations by x and y
      for (int ix=1; ix<gw-1; ix++) {
        for (int iy=1; iy<gh-1; iy++) {
          int ig=iy*gw+ix;
          // compute x difference
          dxr[ig] = par[ig+1]-par[ig-1]; // red
          dxg[ig] = pag[ig+1]-pag[ig-1]; // green
          dxb[ig] = pab[ig+1]-pab[ig-1]; // blue
          // compute y difference
          dyr[ig] = par[ig+gw]-par[ig-gw]; // red
          dyg[ig] = pag[ig+gw]-pag[ig-gw]; // green
          dyb[ig] = pab[ig+gw]-pab[ig-gw]; // blue
        }
      }

      // 3rd sweep : solving optical flow
      for (int ix=1; ix<gw-1; ix++) {
        int x0=ix*gs+gs2;
        for (int iy=1; iy<gh-1; iy++) {
          int y0=iy*gs+gs2;
          int ig=iy*gw+ix;

          // prepare vectors fx, fy, ft
          getnext9(dxr, fx, ig, 0); // dx red
          getnext9(dxg, fx, ig, 9); // dx green
          getnext9(dxb, fx, ig, 18);// dx blue
          getnext9(dyr, fy, ig, 0); // dy red
          getnext9(dyg, fy, ig, 9); // dy green
          getnext9(dyb, fy, ig, 18);// dy blue
          getnext9(dtr, ft, ig, 0); // dt red
          getnext9(dtg, ft, ig, 9); // dt green
          getnext9(dtb, ft, ig, 18);// dt blue

          // solve for (flowx, flowy) such that
          // fx flowx + fy flowy + ft = 0
          solveflow(ig);

          // smoothing
          sflowx[ig]+=(flowx[ig]-sflowx[ig])*wflow;
          sflowy[ig]+=(flowy[ig]-sflowy[ig])*wflow;
        }
      }

      // 4th sweep : draw the flow
      /*if (flagseg) {
        noStroke();
        fill(0);
        for (int ix=0; ix<gw; ix++) {
          int x0=ix*gs+gs2;
          for (int iy=0; iy<gh; iy++) {
            int y0=iy*gs+gs2;
            int ig=iy*gw+ix;

            float u=df*sflowx[ig];
            float v=df*sflowy[ig];

            float a=sqrt(u*u+v*v);
            if (a<2.0) rect(x0, y0, gs, gs);
          }
        }
      }*/

      // clear out our stored flow vectors
      for (int i = flows.size() - 1; i >= 0; i--) 
        flows.remove(i);
      for (int i = flows_color.size() - 1; i >= 0; i--) 
        flows_color.remove(i);

      // 5th sweep : draw the flow
      // update the flow vectors
      //if (flagflow) {  
        for (int ix=0; ix<gw; ix++) {
          int x0=ix*gs+gs2;
          for (int iy=0; iy<gh; iy++) {
            int y0=iy*gs+gs2;
            int ig=iy*gw+ix;

            float u=df*sflowx[ig];
            float v=df*sflowy[ig];

            // draw the line segments for optical flow
            float a=sqrt(u*u+v*v);
            if (a>=2.0) { // draw only if the length >=2.0
              float r=0.5*(1.0+u/(a+0.1));
              float g=0.5*(1.0+v/(a+0.1));
              float b=0.5*(2.0-(r+g));

              // instead of drawing the line now, write it to an array list
              //stroke(255*r, 255*g, 255*b);
              //line(x0, y0, x0+u, y0+v);
              // start
              flows.add(new PVector(x0, y0, 0));
              flows_color.add(new PVector(255*r, 255*g, 255*b));
              // end
              flows.add(new PVector(x0+u, y0+v, 0));
              flows_color.add(new PVector(255*r, 255*g, 255*b));
            }
          }
        }
      //}
    }
    // The following does the same, and is faster when just drawing the image
    // without any additional resizing, transformations, or tint.
    //set(0, 0, cam);
  }
  
  void drawFlow() {
    for (int i = 0; i < flows.size() - 2; i+=2) {
      PVector force_start = flows.get(i);
      PVector force_end = flows.get(i+1);
      
      PVector force_color = flows_color.get(i);
      //println ("force from " + force_start + " to " + force_end);
      stroke(force_color.x, force_color.y, force_color.z);
      line (force_start.x, force_start.y, force_end.x, force_end.y);
    }
  }
  
}
