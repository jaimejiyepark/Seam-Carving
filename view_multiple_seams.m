function view_multiple_seams(im, seams, seamDirection)
  if isa(im, 'char') || isa(im, 'string')
    image = imread(im);
  elseif isa(im, 'uint8')
    image = im;
  else
    disp("boi you need to input in something valid");
  end
  
  [row_size, col_size] = size(seams);
    
  imshow(image)
  for i = 1:row_size
    if strcmp(seamDirection,"HORIZONTAL") == 1
      ploty = seams(i,:);
      plotx = 1:col_size;
    elseif strcmp(seamDirection,"VERTICAL") == 1
      ploty = 1:col_size;
      plotx = seams(i,:);
    end
    hold on
    plot(plotx, ploty, 'r')
    hold on
  end
end