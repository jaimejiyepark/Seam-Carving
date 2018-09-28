function energyImg = energy_img(im)
  if isa(im, 'char') || isa(im, 'string')
    img = imread(im);
  elseif isa(im, 'uint8')
    img = im;
  else
    disp("boi you need to input in something valid");
  end
  
  image = imgaussfilt(img);
  grey_image = rgb2gray(image);
  double_grey_image = double(grey_image);
  dx = fspecial('prewitt');
  dy = dx';
  ix = conv2(double_grey_image, dx, 'same');
  iy = conv2(double_grey_image, dy, 'same');
  energyImg = abs(ix) + abs(iy);
  %imagesc(energyImg);
  %colormap gray;
end



