function I = diffuse_light(P, N, color, mat, lights)
    I = zeros(3,1);
    
    for i = 1 : size(lights, 1)
       L(:,i) = (lights(i).pos' - P) / norm((lights(i).pos' - P));
       
       I = I  + lights(i).intensity' .* mat.kd * max([dot(N,L(:,i)) 0]);
        
    end
    I = I .* color;
end

