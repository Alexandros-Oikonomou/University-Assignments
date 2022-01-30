function I = ambient_light(mat, color, Ia)

    I = color .* Ia .* mat.ka;
    
end

