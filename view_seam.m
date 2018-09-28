function view_seam(im, seam, seamDirection)
  if isa(im, 'char') || isa(im, 'string')
    image = imread(im);
  elseif isa(im, 'uint8')
    image = im;
  else
    disp("boi you need to input in something valid");
  end
  
  seam_size = size(seam,2);
  
  if strcmp(seamDirection,"HORIZONTAL") == 1
    ploty = seam;
    plotx = 1:seam_size;
  elseif strcmp(seamDirection,"VERTICAL") == 1
    ploty = 1:seam_size;
    plotx = seam;
  else
    disp("bruh please enter either HORIZONTAL or VERTICAL. ty");
  end
  
  imshow(image)
  hold on
  plot(plotx, ploty, 'r')
end