function horizontal_seams = find_multiple_horizontal_seams(im, amount)
  energyImg = energy_img(im);  
  col_size = size(energyImg,2);
  horizontal_seams = ones(amount, col_size);
  for n = 1:amount
    cumm_map = cumulative_min_energy_map(energyImg, "HORIZONTAL");
    seam = find_horizontal_seam(cumm_map);
    horizontal_seams(n,:) = seam; 
    [color, energy] = decrease_height(im, energyImg);
    im = color;
    energyImg = energy;
  end
end