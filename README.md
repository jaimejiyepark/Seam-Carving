# Seam Carving 
## What It Is
This project is a version of the content-aware image resizing technique described in
Shai Avidan and Ariel Shamir’s SIGGRAPH 2007 paper, “Seam Carving for Content-Aware Image Resizing”.
## How It Works
This project is able to reduce the size of an image while preserving the main content by removing low intensity pixels. This is achieved by dynamically finding the similarity of neighboring pixels, and removing the optimal seam of pixels from the image.

### Original Image
<img src="images/antelope.jpg" alt="original image" height="700"><br/>
### Left: Content-Aware Resized Image | Right: System Default Resized Image
<img align="left" src="images/my_antelope.png" height="700">
<img align="left" src="images/antelope_resize.png" height="700">
