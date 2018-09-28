function [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg)
  %takes in image as both a path name and a mn3 matrix
  if isa(im, 'char') || isa(im, 'string')
    image = imread(im);
  elseif isa(im, 'uint8')
    image = im;
  else
    disp("boi you need to input in something valid");
  end
  
  [row_size] = size(image,1);  
  h_cumulativeEnergyMap = cumulative_min_energy_map(energyImg, "HORIZONTAL");
  horizontalSeam = find_horizontal_seam(h_cumulativeEnergyMap);
  seam_size = size(horizontalSeam,2);
  
  temp_img = image;
  temp_energy = energyImg;
  %since the temps are copies of the image/energyimg, we can use circshift
  %to shift the unwanted pixel to the ends of the matrix by circularly
  %shifting
  for j = 1:seam_size
    i = horizontalSeam(1,j);
    temp_img(i:row_size,j,:) = circshift(image(i:row_size,j,:), row_size-i);
    temp_energy(i:row_size,j) = circshift(energyImg(i:row_size,j), row_size-i);
  end
  reducedColorImg = temp_img(1:row_size-1,:,:);
  reducedEnergyImg = temp_energy(1:row_size-1,:);
end