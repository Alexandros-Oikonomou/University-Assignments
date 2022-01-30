clc
clear

%% Load data %%
load('hw2.mat');

%% Step 0 -Initial position 
p = V';
% 0.1 Render object with render_object
I0 = render_object(p, F, C, M, N, H, W, w, cv, ck, cu);

% Save result
imwrite(I0, '0.jpg');

%% Step 0.5 - Create a transformation matrix
obj = transformation_matrix();
%% Step 1 - Translate the transformation matrix by t1
% 1.1 Apply translation
obj = translate(t1, obj);
p = affine_transform(p, obj);
% 1.2 Render object with render_object
I1 = render_object(p, F, C, M, N, H, W, w, cv, ck, cu);
% Save result
imwrite(I1, '1.jpg');

%% Step 2 - Rotate the transformation matrix by theta around given axis
% 2.1 Apply rotation
obj = transformation_matrix();
obj = rotate(theta, g, obj);
p = affine_transform(p, obj);
% 2.2 Render object with render_object
I2 = render_object(p, F, C, M, N, H, W, w, cv, ck, cu);
% Save result
imwrite(I2, '2.jpg');

%% Step 3 - Translate the transformation matrix back
% 3.1 Apply translation
obj = transformation_matrix();
obj = translate(t2, obj);
p = affine_transform(p, obj);
% 3.2 Render object with render_object
I3 = render_object(p, F, C, M, N, H, W, w, cv, ck, cu);
% Save result
imwrite(I3, '3.jpg');
