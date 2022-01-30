function cq = affine_transform(cp, T)
%ginetai metasximatismos me ti xrisi tou T

%prosthetoume mia diastasi akoma oste na ginei o pol/mos ton matrices
    cp(4,:) = 1; 
    
    cq = T.T * cp;
    
%afairoume pali tin 4i grammi
    cq(4,:) = [];
end

