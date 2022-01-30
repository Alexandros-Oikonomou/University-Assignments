classdef PhongMaterial
    
    properties
        ka, kd, ks, n_phong
    end
    
    methods
       function obj = PhongMaterial(ka, kd, ks, n_phong)
            obj.ka = ka;
            obj.ks = ks;
            obj.kd = kd;
            obj.n_phong = n_phong;
       end
   end
end

