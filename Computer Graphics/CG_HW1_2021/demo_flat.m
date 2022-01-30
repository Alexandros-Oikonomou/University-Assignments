load racoon_hw1.mat;

%paint the object flat
Img = render(vertices_2d, faces, vertex_colors, depth, 'Flat');

%show image and save
imshow(Img);
imwrite(Img, 'RacoonFlat.png');