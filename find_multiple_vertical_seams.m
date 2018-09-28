function vertical_seams = find_multiple_vertical_seams(im, amount)
  energyImg = energy_img(im); 
  row_size = size(energyImg,1);
  vertical_seams = ones(amount, row_size);
  for n = 1:amount
    cumm_map = cumulative_min_energy_map(energyImg, "VERTICAL");
    seam = find_vertical_seam(cumm_map);
    vertical_seams(n,:) = seam;
    [color, energy] = decrease_width(im, energyImg);
    im = color;
    energyImg = energy;
  end
end