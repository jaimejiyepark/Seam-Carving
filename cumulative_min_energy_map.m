%Q: do we need to wrap around for the minimum energy map
%Q: only check the 3 neighbors? or more

function cumulativeEnergyMap = cumulative_min_energy_map(energyImg,seamDirection)
  %if seam direction is horizontal then transpose the energyimg to use same
  %code as vertical seam
  if strcmp(seamDirection,"HORIZONTAL") == 1
    energyMap = energyImg';
  elseif strcmp(seamDirection,"VERTICAL") == 1
    energyMap = energyImg;
  else
    disp("bruh please enter either HORIZONTAL or VERTICAL. ty");
  end
  
  %initialize the minima map
  cumulativeEnergyMap = ones(size(energyMap));
  %initialize the first row of minima map to first row of energy map
  cumulativeEnergyMap(1,:) = energyMap(1,:);
  [row, col] = size(energyMap);
  
  for i = 2:row
    for j = 1:col
      %if any of the values are out of bounds then set to INF to not get
      %chosen in the min
      %m1 = cum energy map[i-1, j-1]
      if j - 1 <= 0
        m1 = Inf;
      else 
        m1 = cumulativeEnergyMap(i-1, j-1);
      end 
      %m2 = cum energy map[i-1, j]
      m2 = cumulativeEnergyMap(i-1, j);
      %m3 = cum energy map[i-1, j+1]
      if j + 1 > col
        m3 = Inf;
      else 
        m3 = cumulativeEnergyMap(i-1, j+1);
      end
      %minumum cum energy value
      min_val = min([m1, m2, m3]);
      %put in cum energy map[i,j] = energy[i,j] + min_val
      cumulativeEnergyMap(i,j) = energyMap(i,j) + min_val;
    end
  end
  
  %return map to original orientation if it was horizontal
  if strcmp(seamDirection,"HORIZONTAL") == 1
    temp = cumulativeEnergyMap';
    cumulativeEnergyMap = temp;
  end   
end



