function [P,D] = project_cam(w, cv, cx, cy, cz, p)
    T = transformation_matrix();
    T.T = [cx cy cz cv];
    T.T(4,:) = [0 0 0 1];
    
    %Briskoume ta simeia sto CCS
    pcam = system_transform(p, T);
    
    %arxikopoiisi pinakon
    N = size(p, 2);
    P = zeros(2, N);
    D = zeros(N, 1);
    
    
    for i = 1 : N
        %proboles
        %xq = w*xp/zp
        %yq = w*yp/zp
        P(1, i) = -w * pcam(1,i) ./ pcam(3, i);
        P(2, i) = -w * pcam(2,i) ./ pcam(3, i);
        
        %depth = zp
        D(i) = pcam(3,i);
    end
    
end

