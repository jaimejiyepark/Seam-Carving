function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
%index of horizontalSeam array is the row of the cumul energy map
%value of horizontalSeam array is the col of the cumul energy map
  %get size of cum energy map
  hor_cumulative_energy_map = cumulativeEnergyMap';
  [row,col] = size(hor_cumulative_energy_map);
  %initialize vertical seam vector
  horizontalSeam = ones([1,row]);

  lastrow = hor_cumulative_energy_map(row,:);
  [lastc] = find(lastrow == min(lastrow(:)),2);
  %dealing with multiple minimas
  %put in the beginning of the backtrace which is the column value of the
  %last row
  last_col_size = size(lastc,2);
  if last_col_size > 1
    horizontalSeam(1,row) = lastc(1,1);
  else
    horizontalSeam(1,row) = lastc;
  end

  for i = row:-1:2
    j = horizontalSeam(1,i);
    if j - 1 <= 0
      m1 = Inf;
    else 
      m1 = hor_cumulative_energy_map(i-1, j-1);
    end 

    m2 = hor_cumulative_energy_map(i-1, j);

    if j + 1 >= col
      m3 = Inf;
    else 
      m3 = hor_cumulative_energy_map(i-1, j+1);
    end

    min_val = min([m1, m2, m3]);
    %JAIME you can make a switch statement
    if min_val == m1
      horizontalSeam(1, i-1) = j-1;
    elseif min_val == m2
      horizontalSeam(1, i-1) = j;
    elseif min_val == m3
      horizontalSeam(1, i-1) = j+1;
    end
  end
end