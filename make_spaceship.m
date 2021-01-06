function [ myhandles ] = make_spaceship(trf_root, transparency)
% Makes a space-ship with the root transform as the given transform.
% The surfaces are drawn with the given transparency in [0,1]
% A vector of handles to all the surfaces is returned.

ship_dish_profile= 2*sin(linspace(0, pi, 15));
[Xc, Yc, Zc]= cylinder(ship_dish_profile);

% Top dish
trf_top_root= hgtransform('Parent', trf_root);
set(trf_top_root, 'Matrix', makehgtform('translate', [0, 0, 0.2]));
color_top= [0, 0.75, 0.75];
myhandles(1)= surface(Xc, Yc, Zc, 'Parent', trf_top_root, 'FaceColor', color_top, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);

% Bottom dish
trf_bottom_root= hgtransform('Parent', trf_root);
set(trf_bottom_root, 'Matrix', makehgtform('translate', [0, 0, -0.2]));
color_bottom= [0.25, 0.25, 0.25];
myhandles(2)= surface(Xc, Yc, Zc, 'Parent', trf_bottom_root, 'FaceColor', color_bottom, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bottom, 'EdgeAlpha', transparency);

% creates x, y, z coordinates of unit cylinder to draw left tail
[Xt, Yt, Zt]= cylinder([0.4 , 0.3 , 0]);


% Left tail
trf_tailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [0.75,1,2.5]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-1, 1, 0.36]);
% Interpret the order as BFT (left to right)
set(trf_tailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_left= [0.9290, 0.6940, 0.1250]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailleft_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);

% Your code here. Use left tail as a reference and design spaceship as
% shown in the class. You can come up with a new design.

% Right tail
trf_tailright_root= hgtransform('Parent', trf_root);
trf_T= makehgtform('translate', [-1, -1, 0.36]);
set(trf_tailright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
myhandles(4)= surface(Xt, Yt, Zt, 'Parent', trf_tailright_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);

% Left support
trf_supportleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [0.75,0.65,2]);
trf_Ry1= makehgtform('yrotate', pi/3);
trf_T= makehgtform('translate', [-2.5, 1, 0.4]);
color_support = [0.25, 0.25, 0.25];
set(trf_supportleft_root, 'Matrix', trf_T*trf_Ry1*trf_Ry*trf_scale);
myhandles(5)= surface(Xt, Yt, Zt, 'Parent', trf_supportleft_root, 'FaceColor', color_support, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_support, 'EdgeAlpha', transparency);

% Right Support
trf_supportright_root= hgtransform('Parent', trf_root);
trf_T= makehgtform('translate', [-2.5, -1, 0.4]);
set(trf_supportright_root, 'Matrix', trf_T*trf_Ry1*trf_Ry*trf_scale);
myhandles(6)= surface(Xt, Yt, Zt, 'Parent', trf_supportright_root, 'FaceColor', color_support, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_support, 'EdgeAlpha', transparency);

% Left Engine
trf_engineleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [0.75,0.75,2.5]);
trf_T= makehgtform('translate', [-2.4, 1, 2]);
set(trf_engineleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
myhandles(7)= surface(Xt, Yt, Zt, 'Parent', trf_engineleft_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);

% Right Engine
trf_engineright_root= hgtransform('Parent', trf_root);
trf_T= makehgtform('translate', [-2.4, -1, 2]);
set(trf_engineright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
myhandles(8)= surface(Xt, Yt, Zt, 'Parent', trf_engineright_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);

[Xa, Ya, Za]= cylinder([0.4, 0]);

% Left Cap
trf_capleft_root = hgtransform('Parent', trf_root);
trf_T= makehgtform('translate', [-2.55, 1, 2]);
trf_scale= makehgtform('scale', [0.70,0.70,0.50]);
trf_Ry= makehgtform('yrotate', pi/2);
set(trf_capleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
myhandles(9)= surface(Xa, Ya, Za, 'Parent', trf_capleft_root, 'FaceColor', color_top, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);

% Right Cap
trf_capright_root = hgtransform('Parent', trf_root);
trf_T= makehgtform('translate', [-2.55, -1, 2]);
set(trf_capright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
myhandles(9)= surface(Xa, Ya, Za, 'Parent', trf_capright_root, 'FaceColor', color_top, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);

[Xl, Yl, Zl]= cylinder([0 , 0.4 , 0]);

% Left Lander
trf_landerleft_root = hgtransform('Parent', trf_root);
trf_T= makehgtform('translate', [-1.5, 0.75, -0.5]);
trf_Ry = makehgtform('yrotate', pi/2);
trf_scale = makehgtform('scale', [0.5,0.5,3]);
color_lander = [1, 1, 1];
set(trf_landerleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
myhandles(10)= surface(Xl, Yl, Zl, 'Parent', trf_landerleft_root, 'FaceColor', color_lander, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_lander, 'EdgeAlpha', transparency);

% Right Lander
trf_landerright_root = hgtransform('Parent', trf_root);
trf_T= makehgtform('translate', [-1.5, -0.75, -0.5]);
set(trf_landerright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
myhandles(11)= surface(Xl, Yl, Zl, 'Parent', trf_landerright_root, 'FaceColor', color_lander, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_lander, 'EdgeAlpha', transparency);

[Xs, Ys, Zs] = cylinder(0.1);
% Lander Support
trf_landersupleft_root = hgtransform('Parent', trf_root);
trf_landersupright_root = hgtransform('Parent', trf_root);
trf_Tl= makehgtform('translate', [0, 0.75, -0.5]);
trf_Tr= makehgtform('translate', [0, -0.75, -0.5]);
trf_scale = makehgtform('scale', [1,1,0.5]);
set(trf_landersupleft_root, 'Matrix', trf_Tl*trf_scale);
set(trf_landersupright_root, 'Matrix', trf_Tr*trf_scale);
myhandles(12)= surface(Xs, Ys, Zs, 'Parent', trf_landersupleft_root, 'FaceColor', color_bottom, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bottom, 'EdgeAlpha', transparency);
myhandles(13)= surface(Xs, Ys, Zs, 'Parent', trf_landersupright_root, 'FaceColor', color_bottom, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bottom, 'EdgeAlpha', transparency);
end

