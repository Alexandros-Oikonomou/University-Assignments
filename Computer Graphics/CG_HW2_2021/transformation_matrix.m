classdef transformation_matrix
   %klasi pou ulopoiei pinaka metasximatismou T
   
    properties
        T %transformation matrix
    end
    
    methods
        %constructor
        function obj = transformation_matrix()
            obj.T = eye(4);
        end
        
        %pinakas gia rotation
        %tupos rodriguez gia dimiourgia tou R
        function obj = rotate(theta, u, obj)
            obj.T(1:3,1:3) = [(1 - cos(theta)) * u(1)^2 + cos(theta), (1 - cos(theta)) * u(1) * u(2) - sin(theta) * u(3), (1 - cos(theta)) * u(1) * u(3) + sin(theta) * u(2);
                 (1 - cos(theta)) * u(2) * u(1) + sin(theta) * u(3), (1 - cos(theta)) * u(2)^2 + cos(theta), (1 - cos(theta)) * u(2) * u(3) - sin(theta) * u(1);
                 (1 - cos(theta)) * u(3) * u(1) - sin(theta) * u(2), (1 - cos(theta)) * u(3) * u(2) + sin(theta) * u(1), (1 - cos(theta)) * u(3)^2 + cos(theta)];
        end
        
        %pinakas gia translation
        %bazoume to t stin 4i stili tou pinaka
        function obj = translate(t, obj)
            obj.T(1:3,4) = t;
        end
    end
end

