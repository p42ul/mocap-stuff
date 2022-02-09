% ------------------------ Connect markers———————————————
% by Mathias Kirkegaard (2019)
mc = mcread('your_file.c3d');

ap_bm = mcinitanimpar;
ap_bm.conn = [
 1 2; 1 3; 3 4; 2 4; % Head
 7 8; % Torso front
 8 26; 8 27; % Pelvis front
 6 28; 6 29; 25 28; 25 29; % Pelvis back
 28 29; % Pelvis left
 26 27; % Pelvis right
 27 29; 26 28;
 6 11; 6 18; 11 18; 7 11; 7 18; 11 26; 11 28; 18 27; 18 29;
 11 12; 12 13; 13 14; 14 15; 14 16; 16 17; 15 17; % Left arm
 18 19; 19 20; 20 21; 21 22; 21 23; 23 24; 22 24; % Right arm
 26 30; 28 30; 30 31; 31 32; 32 33; 33 34; 34 35; % Left leg
 27 36; 29 36; 36 37; 37 38; 38 39; 39 40; 40 41; % Right leg
 ];
ap_bm.conn2 =[11 18 5 5]; % Neck to between shoulders
% Correct connection marker numbers
ap_bm.conn(ap_bm.conn > 8) = ap_bm.conn(ap_bm.conn > 8) - 2;
ap_bm.conn2(ap_bm.conn2 > 8) = ap_bm.conn2(ap_bm.conn2 > 8) - 2;
ap_bm.conn(ap_bm.conn > (24-2)) = ap_bm.conn(ap_bm.conn > (24-2)) - 1;

mcanimate(mc, ap_bm);
