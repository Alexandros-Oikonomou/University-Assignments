function Y = paint_triangle_gouraud(img, vertices_2d, vertex_colors)

    Y = img;
   
   
   
% sorting triangle points to y1 <= y2 <= y3
% and its colors
% etsi exo to xamilotero simeio , to endiameso kai to psilotero
% kai ta antistoixa xromata
    if vertices_2d(2,2) < vertices_2d(1,2)
        vertices_2d([2 1],:) = vertices_2d([1 2],:);
        vertex_colors([2 1],:) = vertex_colors([1 2],:);
    end
    if vertices_2d(3,2) < vertices_2d(1,2)
        vertices_2d([3 1],:) = vertices_2d([1 3],:);
        vertex_colors([3 1],:) = vertex_colors([1 3],:);
    end
    if vertices_2d(3,2) < vertices_2d(2,2)
        vertices_2d([3 2],:) = vertices_2d([2 3],:);
        vertex_colors([3 2],:) = vertex_colors([2 3],:);
    end


    
%   upologizo ta energa simeia se kathe akmi tou trigonou
%   kai ta xromata se kathe simeio x me grammiki paremboli
%   exoume 2 kontes akmes pou pane apo y1 sto y2 kai apo y2 sto y3
%   me times x: x12,  x23
%   kai xromata color12, color23
%   kai 1 psili akmi pou paei apo y1 sto y3
%   me times x: x13
%   kai xromata color13

%   if y1 == y2 
    if vertices_2d(1,2) == vertices_2d(2,2)
%       x_values = x1;
        x_values = vertices_2d(1,1);
        %lamda = (x2 - x) / (x2 - x1)
        %lamda = (p2(1) - a(1)) / (p2(1) - p1(1)); 
        %for x1 mexri x2
        color12(1,:) = vertex_colors(1,:);
    else
%       m = (x2 - x1) / (y2 - y1);
        m = (vertices_2d(2,1) - vertices_2d(1,1)) / (vertices_2d(2,2) - vertices_2d(1,2));
%       x = x1;
        x = vertices_2d(1,1);
        i=1;
%       for y = y1 to y2
        for y = vertices_2d(1,2):vertices_2d(2,2)
            x_values(i) = x;
            x = x + m;
            %lamda = (y2 - y) / (y2 - y1)
            %lamda = (p2(2) - a(2)) / (p2(2) - p1(2));
            %color12(y) = vector_interp(p1, p2, a, V1, V2, 2)
            color12(i,:) = vector_interp(vertices_2d(1,:), vertices_2d(2,:), [y,y], vertex_colors(1,:), vertex_colors(2,:), 2);
            i = i+1;
        end
    end
    x12 = round(x_values);
   
%   if y2 == y3 
    if vertices_2d(2,2) == vertices_2d(3,2)
%       x_values = x2;
        x_values = vertices_2d(2,1);
        color23(1,:) = vertex_colors(2,:);
    else
%       m = (x3 - x2) / (y3 - y2);
        m = (vertices_2d(3,1) - vertices_2d(2,1)) / (vertices_2d(3,2) - vertices_2d(2,2));
%       x = x2;
        x = vertices_2d(2,1);
        i = 1;
%       for y = y2 to y3
        for y = vertices_2d(2,2):vertices_2d(3,2)
            x_values(i) = x;
            x = x + m;
            %lamda = (y3 - y) / (y3 - y2)
            %lamda = (p3(2) - a(2)) / (p3(2) - p2(2));
            %color23(y) = vector_interp(p2, p3, a, V2, V3, 2)
            color23(i,:) = vector_interp(vertices_2d(2,:), vertices_2d(3,:), [y,y], vertex_colors(2,:), vertex_colors(3,:), 2);
            i = i+1;
        end
    end
    x23 = round(x_values);
    
%   if y1 == y3 
    if vertices_2d(1,2) == vertices_2d(3,2)
%       x_values = x1;
        x_values = vertices_2d(1,1);
        color13(1,:) = vertex_colors(1,:);
    else
%       m = (x3 - x1) / (y3 - y1);
        m = (vertices_2d(3,1) - vertices_2d(1,1)) / (vertices_2d(3,2) - vertices_2d(1,2));
%       x = x1;
        x = vertices_2d(1,1);
        i = 1;
%       for y = y1 to y3
        for y = vertices_2d(1,2):vertices_2d(3,2)
            x_values(i) = x;
            x = x + m;
            %lamda = (y3 - y) / (y3 - y1)
            %lamda = (p3(2) - a(2)) / (p3(2) - p1(2));
            %color13(y) = vector_interp(p1, p3, a, V1, V3, 2)
            color13(i,:) = vector_interp(vertices_2d(1,:), vertices_2d(3,:), [y,y], vertex_colors(1,:), vertex_colors(3,:), 2);
            i = i+1;
        end
    end
    x13 = round(x_values);
    
%   afairo to teleutaio stoixeio apo tin x12 giati einai idio
%   me to proto stoixeio tou x23
    x12(end) = [];
    x123 = [x12 x23];
    
%   afairo to teleutaio stoixeio apo tin color12 giati einai idio
%   me to proto stoixeio tou color23
    color12(end,:) = [];
    color123 = [color12; color23];
    
%   exo x13 ta simeia tis psilis akmis 
%   kai x123 ta simeia apo tis alles 2 akmes
    
% gia na bro poia pleura einai aristera kai poia deksia
% epilego ena simeio apo tin x13 kai to sugkrino me tin x123

    mid = ceil(length(x13)/2);
    if x13(mid) < x123(mid)
        x_left = x13;
        color_left = color13;
        x_right = x123;
        color_right = color123;
    else
        x_left = x123;
        color_left = color123;
        x_right = x13;
        color_right = color13;
    end
     
    
%   for y = y1:y3
%   apo kato pros ta pano
%   apo aristera pros ta deksia kano paint
    i = 1;
    for y = vertices_2d(1,2):vertices_2d(3,2)    
        for x = x_left(y - vertices_2d(1,2)+1):x_right(y - vertices_2d(1,2)+1)
            Y(y,x,:) = vector_interp([x_left(i),y], [x_right(i),y] , [x,x], color_left(i,:), color_right(i,:), 1);
        end
        i = i + 1;
    end

%   sto telos ksana kano paint tis korufes gt kapoies emenan aspres
    Y(vertices_2d(1,2), vertices_2d(1,1), :) = vertex_colors(1,:);
    Y(vertices_2d(2,2), vertices_2d(2,1), :) = vertex_colors(2,:);
    Y(vertices_2d(3,2), vertices_2d(3,1), :) = vertex_colors(3,:);
end


