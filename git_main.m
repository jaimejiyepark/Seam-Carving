image = imread('images/antelope.jpg');
energyImg = energy_img(image);
[x, y, ~] = size(image);
%put in the amount you would like to reduce
resize_amount = 50;

%pick the orientation "VERTICAL" or "HORIZONTAL"
orientation = "VERTICAL";
v_cumm = cumulative_min_energy_map(energyImg, orientation);

%uncomment here if you picked "HORIZONTAL";
%{
seams = find_multiple_horizontal_seams(image, resize_amount);
my_image = GENERAL_seam_carving(image, resize_amount, orientation);
temp = x - resize_amount;
image_resize = imresize(image, [temp, y]);
%}

%uncomment here if you picked "VERTICAL"
%{
seams = find_multiple_vertical_seams(image, resize_amount);
my_image = GENERAL_seam_carving(image, resize_amount, orientation);
temp = y - resize_amount;
image_resize = imresize(image, [x , temp]);
%}

figure('Name',"Dynamic Programming Resizing"), imshow(my_image);
figure('Name', "Default Resizing"), imshow(image_resize);
figure('Name', "Low Intensity Seams"), view_multiple_seams(image, seams, orientation);
