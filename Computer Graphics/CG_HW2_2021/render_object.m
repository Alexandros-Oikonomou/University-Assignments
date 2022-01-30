function I = render_object(p, F, C, M, N, H, W, w, cv, clookat, cup)
%p = pinakas 3d suntetagmenes ton simeion tou obj
%F = pinakas korufon trigonon, kathe seira 3 korufes


    [P, D] = project_cam_ku(w, cv, clookat, cup, p);
    Prast = rasterize(P', M, N, H, W);
    I = render(Prast, F, C, D, 'Gouraud');

end

