% Joint Representation
% by Sebatian Laguerre (2019)

% To obtain kinetic variables, I needed a joint representation of the performer.
% Since I was not provided a bone structure, I had to manually define the marker-
% to-joint structure and the connection matrix. In order to extract marker numbers
% from the marker names, created a small function, mcn2m. Luckily, the same
% markers are used in both performances.

clear;

 m2j = mcinitm2jpar;
 m2j.nMarkers = 20;
 jmn = {{'LASI', 'LPSI', 'RASI', 'RPSI'}, ... % 1 root
 {'LASI', 'LPSI'}, ... % 2 lhip
 'LKNE', ... % 3 lknee
 'LANK', ... % 4 lankle
 'LTOE', ... % 5 ltoe
 {'RASI', 'RPSI'}, ... % 6 lhip
 'RKNE', ... % 7 rknee
 'RANK', ... % 8 rankle
 'RTOE', ... % 9 rtoe
 {'T10', 'STRN'}, ... % 10 midtorso
 {'C7', 'CLAV'}, ... % 11 neck
 {'LFHD', 'RFHD', 'LBHD', 'RBHD'}, ... % 12 head
 'LSHO', ... % 13 lshoulder
 'LELB', ... % 14 lelbow
 {'LWRA', 'LWRB'}, ... % 15 lwrist
 'LFIN', ... % 16 lfinger
 'RSHO', ... % 17 rshoulder
 'RELB', ... % 18 relbow
 {'RWRA', 'RWRB'}, ... % 19 rwrist
 'RFIN'}; % 20 rfinger
 
 
 
 m2j.markerNum = cellfun(@(x) mcn2m(upright,x), jmn, 'UniformOutput', false);
 m2j.markerName = {'root', 'lhip', 'lknee','lankle','ltoe','rhip', 'rknee','rankle','rtoe'};
 sj = mcm2j(upright, m2j);
