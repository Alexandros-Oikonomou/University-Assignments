function X = shade_gouraud(verts_p, verts_n, verts_c, bcoords, cam_pos, mat, lights, Ia, X)


        
    %Ypologismos xromaton RGB
    CR = ambient_light(mat, verts_c(:, 1), Ia) + diffuse_light(bcoords, verts_n(:, 1), verts_c(:, 1), mat, lights) + specular_light(bcoords, verts_n(:, 1), verts_c(:, 1), cam_pos, mat, lights);
    CG = ambient_light(mat, verts_c(:, 2), Ia) + diffuse_light(bcoords, verts_n(:, 2), verts_c(:, 2), mat, lights) + specular_light(bcoords, verts_n(:, 2), verts_c(:, 2), cam_pos, mat, lights);
    CB = ambient_light(mat, verts_c(:, 3), Ia) + diffuse_light(bcoords, verts_n(:, 3), verts_c(:, 3), mat, lights) + specular_light(bcoords, verts_n(:, 3), verts_c(:, 3), cam_pos, mat, lights);
      
      
    
    color = [CR'; CG'; CB'];
    
    
    X = paint_triangle_gouraud(X, verts_p', color);

end

