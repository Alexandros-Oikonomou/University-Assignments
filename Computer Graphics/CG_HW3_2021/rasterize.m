function Prast = rasterize(P, M, N, H, W)
    %metatropi tou petasmatos apo intses se pixel
    
    %[-W/2,W/2]x[-H/2,H/2] to [1,N]x[1,M] 

    %briskoume tin apostasi ton pixel
    dx = W / N;
    dy = H / M;
    
    %se kathe simeio prosthetoume to W/2 i H/2 
    %gia na erthoun ola ta simeia sto (0,0)
    Pr(:,1) = P(:,1) + W/2;
    Pr(:,2) = P(:,2) + H/2;
    
    %diairoume me tin apostasi kai stroggulopoioume sto kontinotero pixel
    Prast(:,1) = round(Pr(:,1)/dx) + 1;
    Prast(:,2) = round(Pr(:,2)/dy) + 1;
    
end

