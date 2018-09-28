%how to deal with multiple minimum of beginning of backtrace or anyway in
%the path?

function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
%index of verticalSeam array is the row of the cumul energy map
%value of verticalSeam array is the col of the cumul energy map
  %get size of cum energy map
  [row,col] = size(cumulativeEnergyMap);
  %initialize vertical seam vector
  verticalSeam = ones([1,row]);
  lastrow = cumulativeEnergyMap(row,:);
  [lastc] = find(lastrow == min(lastrow(:)),2);
  %dealing with multiple minimas
  %put in the beginning of the backtrace which is the column value of the
  %last row
  last_col_size = size(lastc,2);
  if last_col_size > 1
    verticalSeam(1,row) = lastc(1,1);
  else
    verticalSeam(1,row) = lastc;
  end

  for i = row:-1:2
    j = verticalSeam(1,i);
    if j - 1 <= 0
      m1 = Inf;
    else 
      m1 = cumulativeEnergyMap(i-1, j-1);
    end 

    m2 = cumulativeEnergyMap(i-1, j);

    if j + 1 >= col
      m3 = Inf;
    else 
      m3 = cumulativeEnergyMap(i-1, j+1);
    end

    min_val = min([m1, m2, m3]);
    %JAIME you can make a switch statement
    if min_val == m1
      verticalSeam(1, i-1) = j-1;
    elseif min_val == m2
      verticalSeam(1, i-1) = j;
    elseif min_val == m3
      verticalSeam(1, i-1) = j+1;
    end
  end
end