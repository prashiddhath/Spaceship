function trajectory()
handle_axes= axes('XLim', [-10,20], 'YLim', [-5,15], 'ZLim', [-4.3,10]);
xlabel('e_1');
ylabel('e_2');
zlabel('e_3');
view(3);
grid on;
camlight

trf_ship1_root= hgtransform('Parent', handle_axes);
h_original_ship= make_spaceship(trf_ship1_root, 0.8);


for i = 15:-0.25:1
    roll= (15-i)/30;
    pitch= (15-i)/40;
    yaw= pi/(2.5-(i/10));

    trf_roll= makehgtform('xrotate', roll);
    trf_pitch= makehgtform('yrotate', pitch);
    trf_yaw= makehgtform('zrotate', yaw);

    trf_rpy= trf_yaw*trf_pitch*trf_roll;

    translation= [i,(21-i)/7,0-((15-i)/10)];
    trf_translate= makehgtform('translate', translation);
    trf_final= trf_translate*trf_rpy;

    set(trf_ship1_root, 'Matrix', trf_final);
    drawnow;
end

for i = 0:0.25:15
    roll= (14-(i/1.25))/30;
    pitch= (14-(i/1.25))/40;
    yaw= pi/(2.4+(0.3*i));

    trf_roll= makehgtform('xrotate', roll);
    trf_pitch= makehgtform('yrotate', pitch);
    trf_yaw= makehgtform('zrotate', yaw);

    trf_rpy= trf_yaw*trf_pitch*trf_roll;

    translation= [1-((1-(i/15))*i),3+(i/5),-1.4-(0.05*i)];
    trf_translate= makehgtform('translate', translation);
    trf_final= trf_translate*trf_rpy;

    set(trf_ship1_root, 'Matrix', trf_final);
    drawnow;
end

for i=0:2.5:15
    roll= 1/(15+(1.5*i));
    pitch= 1/(20+(1.5*i));
    yaw= pi/6.9;

    trf_roll= makehgtform('xrotate', roll);
    trf_pitch= makehgtform('yrotate', pitch);
    trf_yaw= makehgtform('zrotate', yaw);

    trf_rpy= trf_yaw*trf_pitch*trf_roll;

    translation= [1+(0.05*i),6+(0.01*i),-2.15];
    trf_translate= makehgtform('translate', translation);
    trf_final= trf_translate*trf_rpy;

    set(trf_ship1_root, 'Matrix', trf_final);
    drawnow;
end

for i=1:1.5:30
    roll= 1/(37.5+(1.4*i));
    pitch= 1/(42.5+(1.4*i));
    yaw= pi/6.9;

    trf_roll= makehgtform('xrotate', roll);
    trf_pitch= makehgtform('yrotate', pitch);
    trf_yaw= makehgtform('zrotate', yaw);

    trf_rpy= trf_yaw*trf_pitch*trf_roll;

    translation= [1.75+(0.025*i),6.15,-2.15];
    trf_translate= makehgtform('translate', translation);
    trf_final= trf_translate*trf_rpy;

    set(trf_ship1_root, 'Matrix', trf_final);
    drawnow;
end

for i=1:1.5:30 
    roll= 1/(67.5+(2*i));
    pitch= 1/(72.5+(2*i));
    yaw= pi/6.9;

    trf_roll= makehgtform('xrotate', roll);
    trf_pitch= makehgtform('yrotate', pitch);
    trf_yaw= makehgtform('zrotate', yaw);

    trf_rpy= trf_yaw*trf_pitch*trf_roll;

    translation= [2.65+(0.01*i),6.15,-2.15];
    trf_translate= makehgtform('translate', translation);
    trf_final= trf_translate*trf_rpy;

    set(trf_ship1_root, 'Matrix', trf_final);
    drawnow;
end

for i=1:1:30
    roll= 0;
    pitch= 0;
    yaw= pi/6.9;
    
    trf_roll= makehgtform('xrotate', roll);
    trf_pitch= makehgtform('yrotate', pitch);
    trf_yaw= makehgtform('zrotate', yaw);

    trf_rpy= trf_yaw*trf_pitch*trf_roll;

    translation= [2.95,6.15,-2.15-(0.05*i)];
    trf_translate= makehgtform('translate', translation);
    trf_final= trf_translate*trf_rpy;

    set(trf_ship1_root, 'Matrix', trf_final);
    drawnow;
end
    