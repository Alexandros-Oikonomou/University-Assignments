function normals = calculate_normals(vertices, face_indices)
    
    
    normals = zeros(3,length(vertices));
    
    for i = 1:length(face_indices)
        
        N = cross(vertices(:,face_indices(2,i)) - vertices(:,face_indices(1,i)), vertices(:,face_indices(3,i)) - vertices(:,face_indices(2,i)));

        normals(:, face_indices(1, i)) = normals(:, face_indices(1, i)) + N;
        normals(:, face_indices(2, i)) = normals(:, face_indices(2, i)) + N;
        normals(:, face_indices(3, i)) = normals(:, face_indices(3, i)) + N;
    end
    
    
    for i = 1 : vertices
       normals(:, i) = normals(:, i)/norm(normals(:, i));
    end
end

