function result = GENERAL_seam_carving(im, reduceAmount, seamDirection)
%Reduces the width of the image by 100 pixels
  if isa(im, 'char') || isa(im, 'string')
    image = imread(im);
  elseif isa(im, 'uint8')
    image = im;
  end
  
  energyImg = energy_img(image);
  
  for i = 1:reduceAmount
    if strcmp(seamDirection, "VERTICAL")
      [color, energy] = decrease_width(image, energyImg);
    elseif strcmp(seamDirection, "HORIZONTAL")
      [color, energy] = decrease_height(image, energyImg);      
    end
    image = color;
    energyImg = energy;
  end
  result = image;
end