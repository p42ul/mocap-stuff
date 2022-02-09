clear;

% m2j = mcinitm2jpar;
% m2j.nMarkers = 20;
% jmn = {{'LASI', 'LPSI', 'RASI', 'RPSI'}, ... % 1 root
% {'LASI', 'LPSI'}, ... % 2 lhip
% 'LKNE', ... % 3 lknee
% 'LANK', ... % 4 lankle
% 'LTOE', ... % 5 ltoe
% {'RASI', 'RPSI'}, ... % 6 lhip
% 'RKNE', ... % 7 rknee
% 'RANK', ... % 8 rankle
% 'RTOE', ... % 9 rtoe
% {'T10', 'STRN'}, ... % 10 midtorso
% {'C7', 'CLAV'}, ... % 11 neck
% {'LFHD', 'RFHD', 'LBHD', 'RBHD'}, ... % 12 head
% 'LSHO', ... % 13 lshoulder
% 'LELB', ... % 14 lelbow
% {'LWRA', 'LWRB'}, ... % 15 lwrist
% 'LFIN', ... % 16 lfinger
% 'RSHO', ... % 17 rshoulder
% 'RELB', ... % 18 relbow
% {'RWRA', 'RWRB'}, ... % 19 rwrist
% 'RFIN'}; % 20 rfinger
% 
% 
% 
% m2j.markerNum = cellfun(@(x) mcn2m(upright,x), jmn, 'UniformOutput', false);
% m2j.markerName = {'root', 'lhip', 'lknee','lankle','ltoe','rhip', 'rknee','rankle','rtoe'};
% sj = mcm2j(upright, m2j);

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
