function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)
  [col_size] = size(im,2);
  
  v_cumulativeEnergyMap = cumulative_min_energy_map(energyImg, "VERTICAL");
  verticalSeam = find_vertical_seam(v_cumulativeEnergyMap);
  seam_size = size(verticalSeam,2);
  
  temp_img = im;
  temp_energy = energyImg;
  for i = 1:seam_size
    j = verticalSeam(1,i);
    temp_img(i,j:col_size,:) = circshift(im(i,j:col_size,:), col_size-j);
    temp_energy(i,j:col_size) = circshift(energyImg(i,j:col_size), col_size-j);
  end
    reducedColorImg = uint8(temp_img(:,1:col_size-1,:));
    reducedEnergyImg = double(temp_energy(:,1:col_size-1));
end