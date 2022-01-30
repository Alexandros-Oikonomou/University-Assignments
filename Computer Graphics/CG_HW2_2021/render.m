function Img = render(vertices_2d, faces, vertex_colors, depth, renderer)
    
    Img = ones(1200,1200,3);
    
    %arithmos trigonon
    trinum = size(faces, 1);
    
    %calculate depths mesos oros ton 3 korufon
    depths = trinum;
    for i = 1:trinum
        depths(i) = (depth(faces(i,1)) + depth(faces(i,2)) + depth(faces(i,3))) / 3;
    end
    
    %sort depths fthinousa seira
    [~, sorted_depths] = sort(depths,'descend');
    
    %sort trigona fthinousa seira
    sorted_faces = faces(sorted_depths, :);
    
  
    %Paint each triangle.
    for i = 1 : trinum
        %sorted vertices trigonon
        vertices = [vertices_2d(sorted_faces(i,1), :); vertices_2d(sorted_faces(i,2), :); vertices_2d(sorted_faces(i,3), :)];
        
        %colors trigonon
        colors = [vertex_colors(sorted_faces(i,1), :); vertex_colors(sorted_faces(i,2), :); vertex_colors(sorted_faces(i,3), :)];
        
        %Paint the triangle with the correct method.
        if isequal(renderer, 'Flat')
            Img = paint_triangle_flat(Img, vertices, colors);
        elseif isequal(renderer, 'Gouraud')
            Img = paint_triangle_gouraud(Img, vertices, colors);
        end
    end
end

