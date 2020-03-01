# IML404 // Tangible + Spatial Computing // USC MA+P S20

![bloom (spring 2019)](https://github.com/johnbcarpenter/USC_IML404_IMAGES/blob/master/images/remi-wedin-bloom.png)
<sup>^ [_bloom_](https://www.remiwedin.com/bloom) (spring 2019) by remi wedin</sup>

_Tangible and Spatial Computing_ is a course offered by [Media Arts + Practice](https://cinema.usc.edu/imap/index.cfm) in the School of Cinematic Arts at USC.  The course is an examination of existing and emergent media technologies, focusing on creative and critical tactics to discover the full potential for software and hardware in your work.

We will explore human computer interaction -- including how gesture, haptics, sound and other forms of data can be used to interact with software + hardware -- and instruction will draw heavily on practical experience in the art + design worlds.  The projects aim to help students think about technology in new ways, and to inspire and empower you to use it in your own work.

We'll primarily be working with [Processing](http://www.processing.org/) and [Arduino](http://www.arduino.cc/) in this course, though we'll also look at some other platforms... e.g. connecting [p5js](http://p5js.org) to [Google's Teachable Machine 2](http://teachablemachine.withgoogle.com/). This repository will be used to store and share the code that we discuss in class. The starting point for many of these examples is based on fantastic work by the creative coding community -- please see the course notes + comments in the code for credits.

<pre>
<b>Instructor: <a href="http://johnbcarpenter.com">John Carpenter</a></b>
office hours: monday 3-4pm, 7pm+ in the SCIL lobby / conference room <i>by appointment</i>
<b>TA: <a href="http://www.brianacantrell.com">Brian Cantrell</a></b>
office hours: TBD
<b>SA: <a href="https://www.remiwedin.com">Remi Wedin</a></b>
office hours: TBD
</pre>

<pre>
<b><a href="https://moodle.sca.usc.edu/course/view.php?id=105">Course Moodle</a><b>
<b><a href="https://drive.google.com/drive/u/1/folders/0AEx6eZWiSATLUk9PVA">Google Drive for Homework</a><b>
</pre>

## WEEKLY SCHEDULE

<pre>
<b>class Processing () {</b>
  - Week 01. 01/13/2019 class intro // computer vision intro
    - <a href="http://github.com/johnbcarpenter/USC_IML404/blob/master/SYLLABUS/IML404-MAP-SPRING2020.pdf">syllabus</a>
    - <a href="https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/computer-vision-webcam-opencv.md">computer vision: rgb camera, filters, openCV</a>
    - <a href="https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/computer-vision-opticalflow.md">optical flow</a>

  - <i>// Week 02. 01/20/2019 MLK day</i>

  - Week 03. 01/27/2019 processing: computer vision as UX
    - <a href="https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/computer-vision-opticalflow-NOC.md">Nature of Code (Shiffman agents) + optical flow</a>
    - <a href="https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/RGB_CAMERA/OpticalFlow_BouncyBall">review: classes + arrays in processing</a>  

  - Week 04. 02/03/2019 processing: 3D generative + interactive artworks
    - <a href="https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/threeD.md">3D, Optical Flow, 3D generative artwork intro</a>
    - <a href="https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/shaders.md">basic shaders in processing (3D cues + sprites)</a>

  - Week 05. 02/10/2019 <a href="https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/processing-project.md">PROCESSING PROJECT01</a> working session
    - <a href="https://www.instagram.com/j2rgb/">justin shrake</a> guest lecture on <a href="https://github.com/jshrake/p5js-vertex-shader">vertex shaders in p5js</a>

  - <i>// Week 06. 02/17/2019 President’s Day</i>

  - Week 07. 02/24/2019 <b><a href="https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/processing-project.md">PROCESSING PROJECT01</a> REVIEW</b>
    - project presentations
    - <a href="https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/datavis-intro-pixels-sound.md">datavis intro: pixels, sound</a>

  - Week 08. 03/02/2019 processing: datavis
    - <a href="https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/datavis-csv-transform-sound.md">datavis: loading CSVs, 3D transforms, sound</a>

  - Week 09. 03/09/2019 processing: 3D scanning
    - <a href="https://github.com/johnbcarpenter/USC_IML404/tree/master/notes_md/computer-vision-kinect.md">kinect</a> / realsense + iphoneX
      - point clouds, agents
      - OpenNI (via <a href="https://github.com/totovr/SimpleOpenNI">totovr</a>)
    - <a href="https://apps.apple.com/ca/app/capture-3d-scan-anything/id1444183458">Capture: 3D Scan Anything</a> --> Processing

  - <i>// Week 10. Spring Recess 03/15 - 03/22/2019</i>

  - Week 11. 03/23/2019 processing: ML
    - <a href="https://github.com/johnbcarpenter/USC_IML404/tree/master/CODE/PROCESSING/ARTIFICIAL_NEURAL_NETWORKS/Fried_ANN_tutorial">ANN intro: number recognition</a> (via <a href="https://medium.com/typeme/lets-code-a-neural-network-from-scratch-part-1-24f0a30d7d62">fried</a>)
    - <a href="https://teachablemachine.withgoogle.com/train">Teachable Machine 2</a> (via <a href="https://thecodingtrain.com/TeachableMachine/index.html">shiffman's coding train</a>)

  - Week 12. 03/30/2019 PROCESSING PROJECT02 working session

  - Week 13. 04/06/2019 <b>PROCESSING PROJECT02 REVIEW</b>
    - in-class critique (with guest reviewer*) *TBD
    - arduino guest talk: electronics for art and design (PETE HAWKES)
<b>}</b>
</pre>

<pre>
<b>class Arduino () {</b>
  - Week 14. 04/13/2019 arduino: intro + LED blinks

  - Week 15. 04/20/2019 arduino: sensors + actuators
    - microcontrollers / leds / knobs / pots
    - photocells / servos
    - buttons / piezo / debounce

  - Week 16. 04/27/2019 arduino, processing serial
    - fabrication : ARDUINO PROJECT working session
    - processing <--> serial

  - <i>// Week 17. Study Days: 05/02 - 05/05/2019 (no class)</i>

  - FINAL. 05/11/2019 4:30-6:30 p.m. <b>ARDUINO PROJECT REVIEW</b>
<b>}</b>
</pre>

## GALLERY

[Student Work (Spring 16 -> Spring 19)](https://github.com/johnbcarpenter/USC_IML404/blob/master/notes_md/gallery.md)
