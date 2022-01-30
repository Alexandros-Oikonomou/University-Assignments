function value = vector_interp(p1, p2, a, V1, V2, dim)
%     a(x,y) = simeio parembolis
%     p1(x1,y1) = korufi p1
%     p2(x2,y2) = korufi p2
%     V1(r,g,b) xroma korufis p1
%     V2(r,g,b) xroma korufis p2

    %orizontia dim = 1
    if dim == 1
        if p1(1) == p2(1)
            %lamda = (x2 - x) / (x2 - x1)
            %gia na min ginei diairesi me to 0
            %den epairne xroma i korufi kai emene aspri
            lamda = 0.5;
        else
        %lamda = (x2 - x) / (x2 - x1)
            lamda = abs((p2(1) - a(1)) / (p2(1) - p1(1))); 
        end
    %katheta dim = 2
    elseif dim == 2
        %lamda = (y2 - y) / (y2 - y1)
        lamda = abs((p2(2) - a(2)) / (p2(2) - p1(2)));
    end
    value = lamda * V1 + (1 - lamda) * V2;
end

