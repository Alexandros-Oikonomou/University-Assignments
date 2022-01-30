load racoon_hw1.mat;

%paint the object gouraud
Img = render(vertices_2d, faces, vertex_colors, depth, 'Gouraud');

%show image and save
imshow(Img);
imwrite(Img, 'RacoonGouraud.png');