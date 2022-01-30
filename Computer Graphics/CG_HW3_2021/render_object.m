function Img = render_object(shader, focal, eye, lookat, up, bg_color, M, N, H, W, verts, vert_colors, face_indices, mat, lights, Ia)

    
    % arxikopoiisi kamba
    Img = zeros(M, N, 3);
    for i = 1 : 3
       Img(:, :, i) = bg_color(i); 
    end
    
    % ypologismos kanonikon dianusmaton
    normals = calculate_normals(verts, face_indices);
    
    % proboles kai bathi
    [P, D] = project_cam_ku(focal, eye, lookat, up, verts);  
        
    % Rasterize
    Prast = rasterize(P', M, N, H, W);
    Prast = Prast';
    
    
    %arithmos trigonon
    trinum = size(face_indices, 2);
    
    %calculate depths mesos oros ton 3 korufon
    depths = zeros(1, trinum);
    
    for i = 1:trinum
        depths(i) = (D(face_indices(1,i)) + D(face_indices(2,i)) + D(face_indices(3,i))) / 3;
    end
    
     %sort depths fthinousa seira
    [~, sorted_depths] = sort(depths,'descend');
    
    %sort trigona fthinousa seira
    sorted_faces = face_indices(:, sorted_depths);
    
  
    %Paint each triangle.
%     for i = 1 : trinum
%         %sorted vertices trigonon
%         vertices = [verts(sorted_faces(1,i), :); verts(sorted_faces(2,i), :); verts(sorted_faces(3,i), :)];
%     end   
    
   %gia kathe trigono
    for i = 1 : trinum

            %vertex 
            verts_p = [Prast(:, sorted_faces(1, i)) Prast(:, sorted_faces(2, i)) Prast(:, sorted_faces(3, i))];

            %normal vector 
            verts_n = [normals(:, sorted_faces(1, i)) normals(:, sorted_faces(2, i)) normals(:, sorted_faces(3, i))];

            %center of gravity trigonon
            bcoords = ( verts(:, sorted_faces(1, i)) + verts(:, sorted_faces(2, i)) + verts(:, sorted_faces(3, i)) )/3;

            %color vector
            verts_c = [vert_colors(:, sorted_faces(1, i)) vert_colors(:, sorted_faces(2, i)) vert_colors(:, sorted_faces(3, i))];
            

            %Paint 
            if shader == 1
                Img = shade_gouraud(verts_p, verts_n, verts_c, bcoords, eye, mat, lights, Ia, Img);

            elseif shader == 2
                Img = shade_phong(verts_p, verts_n, verts_c, bcoords, eye, mat, lights, Ia, Img);

            end
        
    end
    
end

