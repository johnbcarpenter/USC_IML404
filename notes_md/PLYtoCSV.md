# PLY to CSV conversion

### Part I. Export to PLY
- Create a free Standard Cyborg account: https://platform.standardcyborg.com/
- Log into your account on your phone and save your pointcount (it should automatically show up in your Standard Cyborg "Scans" gallery now).
- Select the scan your interested in.  In the top right corner download the PLY version of the file to your computer.

### Part II. Convert your PLY to a CSV
- Download and install Sublime text editor: https://www.sublimetext.com/3
- Open your PLY in Sublime.
- Create the header for your CSV:

Change
```
ply
format ascii 1.0
comment StandardCyborgFusionVersion 1.2.0
comment StandardCyborgFusionMetadata { "color_space": "sRGB" }
element vertex 136714
property float x
property float y
property float z
property float nx
property float ny
property float nz
property uchar red
property uchar green
property uchar blue
property float surfel_radius
element face 0
property list uchar int vertex_indices
end_header
-0.2187 -0.1910 -0.4655 0.4775 0.0487 0.8773 126 92 68 0.000501
-0.2550 -0.1786 -0.4329 0.6296 0.3808 0.6772 115 84 61 0.000474
-0.2551 -0.1775 -0.4301 0.6567 0.4745 0.5862 114 83 60 0.000476
```

to

```
x,y,z,nx,ny,nz,red,green,blue,surfel_radius
-0.2187,-0.1910,-0.4655,0.4775,0.0487,0.8773,126,92,68,0.000501
-0.2550,-0.1786,-0.4329,0.6296,0.3808,0.6772,115,84,61,0.000474
-0.2551,-0.1775,-0.4301,0.6567,0.4745,0.5862,114,83,60,0.000476
```
(Note: the 3 rows of numbers will be different... just left them as a reference)

- Convert all remaining spaces " " to commas ",": On the mac, *shift+command+f*... Find " " (space, no ""), replace with "," (comma, no ""), hit *Replace* and **WAIT FOR A MINUTE**..
- Eventually, a window will come up and ask if you want to replace all 455,677 instances, confirm (click yes).
- *Save as* the file as *Scan-2022-03-02--17-52-08.csv*
