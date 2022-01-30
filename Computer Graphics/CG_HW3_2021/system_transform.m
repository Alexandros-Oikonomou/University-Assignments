function dp = system_transform(cp, T)
%upologismos suntetagmenon os pros allo sustima

%prosthetoume mia diastasi akoma oste na ginei o pol/mos ton matrices
    cp(4,:) = 1;
    
%pol/mos me ton antistrofo tou T
    dp = T.T \ cp;
    
%afairoume pali tin 4i grammi
    dp(4,:) = [];
end

