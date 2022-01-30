function Y = paint_triangle_flat(img, vertices_2d, vertex_colors)
   Y = img;
   %mesos oros xromaton r,g,b
   color = mean(vertex_colors);
   

% sorting triangle points to y1 <= y2 <= y3
% etsi exo to xamilotero simeio , to endiameso kai to psilotero
    if vertices_2d(2,2) < vertices_2d(1,2)
        vertices_2d([2 1],:) = vertices_2d([1 2],:);
    end
    if vertices_2d(3,2) < vertices_2d(1,2)
        vertices_2d([3 1],:) = vertices_2d([1 3],:);
    end
    if vertices_2d(3,2) < vertices_2d(2,2)
        vertices_2d([3 2],:) = vertices_2d([2 3],:);
    end


    
%   upologizo ta energa simeia se kathe akmi tou trigonou
%   exoume 2 kontes akmes pou pane apo y1 sto y2 kai apo y2 sto y3
%   me times x: x12,  x23
%   kai 1 psili akmi pou paei apo y1 sto y3
%   me times x: x13

%   if y1 == y2 
    if vertices_2d(1,2) == vertices_2d(2,2)
%       x_values = x1;
        x12_values = vertices_2d(1,1);
    else
%       m = (x2 - x1) / (y2 - y1);
        m = (vertices_2d(2,1) - vertices_2d(1,1)) / (vertices_2d(2,2) - vertices_2d(1,2));
%       x = x1;
        x = vertices_2d(1,1);
        i=1;
%       for y = y1 to y2
        for y = vertices_2d(1,2):vertices_2d(2,2)
            x12_values(i) = x;
            x = x + m;
            i = i+1;
        end
    end
    x12 = round(x12_values);
   
%   if y2 == y3 
    if vertices_2d(2,2) == vertices_2d(3,2)
%       x_values = x2;
        x23_values = vertices_2d(2,1);
    else
%       m = (x3 - x2) / (y3 - y2);
        m = (vertices_2d(3,1) - vertices_2d(2,1)) / (vertices_2d(3,2) - vertices_2d(2,2));
%       x = x2;
        x = vertices_2d(2,1);
        i = 1;
%       for y = y2 to y3
        for y = vertices_2d(2,2):vertices_2d(3,2)
            x23_values(i) = x;
            x = x + m;
            i = i+1;
        end
    end
    x23 = round(x23_values);
    
%   if y1 == y3 
    if vertices_2d(1,2) == vertices_2d(3,2)
%       x_values = x1;
        x13_values = vertices_2d(1,1);
    else
%       m = (x3 - x1) / (y3 - y1);
        m = (vertices_2d(3,1) - vertices_2d(1,1)) / (vertices_2d(3,2) - vertices_2d(1,2));
%       x = x1;
        x = vertices_2d(1,1);
        i = 1;
%       for y = y1 to y3
        for y = vertices_2d(1,2):vertices_2d(3,2)
            x13_values(i) = x;
            x = x + m;
            i = i+1;
        end
    end
    x13 = round(x13_values);
    
%   afairo to teleutaio stoixeio apo tin x12 giati einai idio
%   me to proto stoixeio tou x23
    x12(end) = [];
    x123 = [x12 x23];
    
%   exo x13 ta simeia tis psilis akmis 
%   kai x123 ta simeia apo tis alles 2 akmes
    
% gia na bro poia pleura einai aristera kai poia deksia
% epilego ena simeio apo tin x13 kai to sugkrino me tin x123

    mid = ceil(length(x13)/2);
    if x13(mid) < x123(mid)
        x_left = x13;
        x_right = x123;
    else
        x_left = x123;
        x_right = x13;
    end
    
%   for y = y1:y3
%   apo kato pros ta pano
%   apo aristera pros ta deksia kano paint
    for y = vertices_2d(1,2):vertices_2d(3,2)
        for x = x_left(y - vertices_2d(1,2)+1):x_right(y - vertices_2d(1,2)+1)
            Y(y,x,:) = color;
        end
    end
    
end

