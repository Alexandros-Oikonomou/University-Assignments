function I = specular_light(P, N, color, cam_pos, mat, lights)
    I = zeros(3,1);
    V = (cam_pos - P)/ norm(cam_pos - P);
    
    for i = 1 : size(lights, 1)
    
        L = (lights(i).pos' - P)/ (norm(lights(i).pos' - P));
        
        I = I + lights(i).intensity' * mat.ks * max([(dot(2*N*dot(N,L)-L,V)^mat.n_phong) 0]);
        
    end
  
    I = I .* color;
end

