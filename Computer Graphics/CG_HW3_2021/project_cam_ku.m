function [P, D] = project_cam_ku(w, cv, clookat, cup, p)
     
    %Zc = CK / norm(CK)
    cz = (clookat - cv)/ norm(clookat - cv);
    
    %t = u - dot(u, Zc) * Zc
    t = cup - dot(cup, cz) * cz;
    
    %Yc = t / norm(t)
    cy = t/norm(t);
    
    %Xc = cross(Yc, Zc)
    cx = cross(cy, cz);

    %klisi tis project cam gia na broume tous pinakes
    [P, D] = project_cam(w, cv, cx, cy, cz, p);
end

