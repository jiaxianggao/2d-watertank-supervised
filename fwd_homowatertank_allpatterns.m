% To find the conductivity of saline in Finnish testset

clear
fmdl=mk_common_model('d2d1c',16);
fmdl.fwd_model.nodes = fmdl.fwd_model.nodes*14;

figure(1)
show_fem(fmdl.fwd_model);
title('2D FEM model');

% 'd' vertex density (a-j a=low, j=high)
% '2' two dimensional
% 'd' use the 'distmesh' generator
% '0' electrode refinement level is 1 (0 = no refinement)
% 'c' circular model

% two ways of creating an image data, built-in function or manually
% img=mk_image(fmdl);
% show_fem(img);

% Here we create an image data manually (a struct)
img=eidors_obj('image','saline');
img.fwd_model=fmdl.fwd_model;
img.elem_data=fmdl.fwd_model.elems(:,1);
% show_fem(img);


% forward model that matches the stimulation & measurement patterns
Eff_curr=2/sqrt(2); %the effective value of alternate current 
Measpattern=...
[1	-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	1	-1	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	1	-1	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	1	-1	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	1	-1	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	1	-1	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	1	-1	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	1	-1	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	1	-1	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	1	-1	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	1	-1	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0   1	-1	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	1	-1	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	1	-1	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	-1
-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1];
%Set 1: Adjacent injections
stim(1).stimulation = 'Amp';
stim(1).stim_pattern= [Eff_curr;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
stim(1).meas_pattern= Measpattern;
stim(2).stimulation = 'Amp';
stim(2).stim_pattern= [0;Eff_curr;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0];
stim(2).meas_pattern= Measpattern;
stim(3).stimulation = 'Amp';
stim(3).stim_pattern= [0;0;Eff_curr;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0];
stim(3).meas_pattern= Measpattern;
stim(4).stimulation = 'Amp';
stim(4).stim_pattern= [0;0;0;Eff_curr;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0];
stim(4).meas_pattern= Measpattern;
stim(5).stimulation = 'Amp';
stim(5).stim_pattern= [0;0;0;0;Eff_curr;-Eff_curr;0;0;0;0;0;0;0;0;0;0];
stim(5).meas_pattern= Measpattern;
stim(6).stimulation = 'Amp';
stim(6).stim_pattern= [0;0;0;0;0;Eff_curr;-Eff_curr;0;0;0;0;0;0;0;0;0];
stim(6).meas_pattern= Measpattern;
stim(7).stimulation = 'Amp';
stim(7).stim_pattern= [0;0;0;0;0;0;Eff_curr;-Eff_curr;0;0;0;0;0;0;0;0];
stim(7).meas_pattern= Measpattern;
stim(8).stimulation = 'Amp';
stim(8).stim_pattern= [0;0;0;0;0;0;0;Eff_curr;-Eff_curr;0;0;0;0;0;0;0];
stim(8).meas_pattern= Measpattern;
stim(9).stimulation = 'Amp';
stim(9).stim_pattern= [0;0;0;0;0;0;0;0;Eff_curr;-Eff_curr;0;0;0;0;0;0];
stim(9).meas_pattern= Measpattern;
stim(10).stimulation = 'Amp';
stim(10).stim_pattern= [0;0;0;0;0;0;0;0;0;Eff_curr;-Eff_curr;0;0;0;0;0];
stim(10).meas_pattern= Measpattern;
stim(11).stimulation = 'Amp';
stim(11).stim_pattern= [0;0;0;0;0;0;0;0;0;0;Eff_curr;-Eff_curr;0;0;0;0];
stim(11).meas_pattern= Measpattern;
stim(12).stimulation = 'Amp';
stim(12).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;Eff_curr;-Eff_curr;0;0;0];
stim(12).meas_pattern= Measpattern;
stim(13).stimulation = 'Amp';
stim(13).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;-Eff_curr;0;0];
stim(13).meas_pattern= Measpattern;
stim(14).stimulation = 'Amp';
stim(14).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;-Eff_curr;0];
stim(14).meas_pattern= Measpattern;
stim(15).stimulation = 'Amp';
stim(15).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;-Eff_curr];
stim(15).meas_pattern= Measpattern;
stim(16).stimulation = 'Amp';
stim(16).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr];
stim(16).meas_pattern= Measpattern;

% Set2:skip1
stim(17).stimulation = 'Amp';
stim(17).stim_pattern= [Eff_curr;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0]; %1-3
stim(17).meas_pattern= Measpattern;
stim(18).stimulation = 'Amp';
stim(18).stim_pattern= [0;Eff_curr;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0]; %2-4
stim(18).meas_pattern= Measpattern;
stim(19).stimulation = 'Amp';
stim(19).stim_pattern= [0;0;Eff_curr;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0]; %3-5
stim(19).meas_pattern= Measpattern;
stim(20).stimulation = 'Amp';
stim(20).stim_pattern= [0;0;0;Eff_curr;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0]; %4-6
stim(20).meas_pattern= Measpattern;
stim(21).stimulation = 'Amp';
stim(21).stim_pattern= [0;0;0;0;Eff_curr;0;-Eff_curr;0;0;0;0;0;0;0;0;0]; %5-7
stim(21).meas_pattern= Measpattern;
stim(22).stimulation = 'Amp';
stim(22).stim_pattern= [0;0;0;0;0;Eff_curr;0;-Eff_curr;0;0;0;0;0;0;0;0]; %6-8
stim(22).meas_pattern= Measpattern;
stim(23).stimulation = 'Amp';
stim(23).stim_pattern= [0;0;0;0;0;0;Eff_curr;0;-Eff_curr;0;0;0;0;0;0;0]; %7-9
stim(23).meas_pattern= Measpattern;
stim(24).stimulation = 'Amp';
stim(24).stim_pattern= [0;0;0;0;0;0;0;Eff_curr;0;-Eff_curr;0;0;0;0;0;0]; %8-10
stim(24).meas_pattern= Measpattern;
stim(25).stimulation = 'Amp';
stim(25).stim_pattern= [0;0;0;0;0;0;0;0;Eff_curr;0;-Eff_curr;0;0;0;0;0]; %9-11
stim(25).meas_pattern= Measpattern;
stim(26).stimulation = 'Amp';
stim(26).stim_pattern= [0;0;0;0;0;0;0;0;0;Eff_curr;0;-Eff_curr;0;0;0;0]; %10-12
stim(26).meas_pattern= Measpattern;
stim(27).stimulation = 'Amp';
stim(27).stim_pattern= [0;0;0;0;0;0;0;0;0;0;Eff_curr;0;-Eff_curr;0;0;0]; %11-13
stim(27).meas_pattern= Measpattern;
stim(28).stimulation = 'Amp';
stim(28).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;-Eff_curr;0;0]; %12-14
stim(28).meas_pattern= Measpattern;
stim(29).stimulation = 'Amp';
stim(29).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;-Eff_curr;0]; %13-15
stim(29).meas_pattern= Measpattern;
stim(30).stimulation = 'Amp';
stim(30).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;-Eff_curr]; %14-16
stim(30).meas_pattern= Measpattern;
stim(31).stimulation = 'Amp';
stim(31).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0]; %15-1
stim(31).meas_pattern= Measpattern;
stim(32).stimulation = 'Amp';
stim(32).stim_pattern= [0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr]; %16-2
stim(32).meas_pattern= Measpattern;

% Set3:skip2
stim(33).stimulation = 'Amp';
stim(33).stim_pattern= [Eff_curr;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0]; %1-4
stim(33).meas_pattern= Measpattern;
stim(34).stimulation = 'Amp';
stim(34).stim_pattern= [0;Eff_curr;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0]; %2-5
stim(34).meas_pattern= Measpattern;
stim(35).stimulation = 'Amp';
stim(35).stim_pattern= [0;0;Eff_curr;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0]; %3-6
stim(35).meas_pattern= Measpattern;
stim(36).stimulation = 'Amp';
stim(36).stim_pattern= [0;0;0;Eff_curr;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0]; %4-7
stim(36).meas_pattern= Measpattern;
stim(37).stimulation = 'Amp';
stim(37).stim_pattern= [0;0;0;0;Eff_curr;0;0;-Eff_curr;0;0;0;0;0;0;0;0]; %5-8
stim(37).meas_pattern= Measpattern;
stim(38).stimulation = 'Amp';
stim(38).stim_pattern= [0;0;0;0;0;Eff_curr;0;0;-Eff_curr;0;0;0;0;0;0;0]; %6-9
stim(38).meas_pattern= Measpattern;
stim(39).stimulation = 'Amp';
stim(39).stim_pattern= [0;0;0;0;0;0;Eff_curr;0;0;-Eff_curr;0;0;0;0;0;0]; %7-10
stim(39).meas_pattern= Measpattern;
stim(40).stimulation = 'Amp';
stim(40).stim_pattern= [0;0;0;0;0;0;0;Eff_curr;0;0;-Eff_curr;0;0;0;0;0]; %8-11
stim(40).meas_pattern= Measpattern;
stim(41).stimulation = 'Amp';
stim(41).stim_pattern= [0;0;0;0;0;0;0;0;Eff_curr;0;0;-Eff_curr;0;0;0;0]; %9-12
stim(41).meas_pattern= Measpattern;
stim(42).stimulation = 'Amp';
stim(42).stim_pattern= [0;0;0;0;0;0;0;0;0;Eff_curr;0;0;-Eff_curr;0;0;0]; %10-13
stim(42).meas_pattern= Measpattern;
stim(43).stimulation = 'Amp';
stim(43).stim_pattern= [0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;-Eff_curr;0;0]; %11-14
stim(43).meas_pattern= Measpattern;
stim(44).stimulation = 'Amp';
stim(44).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;-Eff_curr;0]; %12-15
stim(44).meas_pattern= Measpattern;
stim(45).stimulation = 'Amp';
stim(45).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;-Eff_curr]; %13-16
stim(45).meas_pattern= Measpattern;
stim(46).stimulation = 'Amp';
stim(46).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0]; %14-1
stim(46).meas_pattern= Measpattern;
stim(47).stimulation = 'Amp';
stim(47).stim_pattern= [0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0]; %15-2
stim(47).meas_pattern= Measpattern;
stim(48).stimulation = 'Amp';
stim(48).stim_pattern= [0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr]; %16-3
stim(48).meas_pattern= Measpattern;

% Set4:skip3
stim(49).stimulation = 'Amp';
stim(49).stim_pattern= [Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0]; %1-5
stim(49).meas_pattern= Measpattern;
stim(50).stimulation = 'Amp';
stim(50).stim_pattern= [0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0]; %2-6
stim(50).meas_pattern= Measpattern;
stim(51).stimulation = 'Amp';
stim(51).stim_pattern= [0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0]; %3-7
stim(51).meas_pattern= Measpattern;
stim(52).stimulation = 'Amp';
stim(52).stim_pattern= [0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0;0]; %4-8
stim(52).meas_pattern= Measpattern;
stim(53).stimulation = 'Amp';
stim(53).stim_pattern= [0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0]; %5-9
stim(53).meas_pattern= Measpattern;
stim(54).stimulation = 'Amp';
stim(54).stim_pattern= [0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0]; %6-10
stim(54).meas_pattern= Measpattern;
stim(55).stimulation = 'Amp';
stim(55).stim_pattern= [0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0]; %7-11
stim(55).meas_pattern= Measpattern;
stim(56).stimulation = 'Amp';
stim(56).stim_pattern= [0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0]; %8-12
stim(56).meas_pattern= Measpattern;
stim(57).stimulation = 'Amp';
stim(57).stim_pattern= [0;0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0]; %9-13
stim(57).meas_pattern= Measpattern;
stim(58).stimulation = 'Amp';
stim(58).stim_pattern= [0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0]; %10-14
stim(58).meas_pattern= Measpattern;
stim(59).stimulation = 'Amp';
stim(59).stim_pattern= [0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0]; %11-15
stim(59).meas_pattern= Measpattern;
stim(60).stimulation = 'Amp';
stim(60).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr]; %12-16
stim(60).meas_pattern= Measpattern;
stim(61).stimulation = 'Amp';
stim(61).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0]; %13-1
stim(61).meas_pattern= Measpattern;
stim(62).stimulation = 'Amp';
stim(62).stim_pattern= [0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0]; %14-2
stim(62).meas_pattern= Measpattern;
stim(63).stimulation = 'Amp';
stim(63).stim_pattern= [0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0]; %15-3
stim(63).meas_pattern= Measpattern;
stim(64).stimulation = 'Amp';
stim(64).stim_pattern= [0;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;Eff_curr]; %16-4
stim(64).meas_pattern= Measpattern;
% Set5:all against 1
stim(65).stimulation = 'Amp';
stim(65).stim_pattern= [-Eff_curr;Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0;0]; %2-1
stim(65).meas_pattern= Measpattern;
stim(66).stimulation = 'Amp';
stim(66).stim_pattern= [-Eff_curr;0;Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0]; %3-1
stim(66).meas_pattern= Measpattern;
stim(67).stimulation = 'Amp';
stim(67).stim_pattern= [-Eff_curr;0;0;Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0]; %4-1
stim(67).meas_pattern= Measpattern;
stim(68).stimulation = 'Amp';
stim(68).stim_pattern= [-Eff_curr;0;0;0;Eff_curr;0;0;0;0;0;0;0;0;0;0;0]; %5-1
stim(68).meas_pattern= Measpattern;
stim(69).stimulation = 'Amp';
stim(69).stim_pattern= [-Eff_curr;0;0;0;0;Eff_curr;0;0;0;0;0;0;0;0;0;0]; %6-1
stim(69).meas_pattern= Measpattern;
stim(70).stimulation = 'Amp';
stim(70).stim_pattern= [-Eff_curr;0;0;0;0;0;Eff_curr;0;0;0;0;0;0;0;0;0]; %7-1
stim(70).meas_pattern= Measpattern;
stim(71).stimulation = 'Amp';
stim(71).stim_pattern= [-Eff_curr;0;0;0;0;0;0;Eff_curr;0;0;0;0;0;0;0;0]; %8-1
stim(71).meas_pattern= Measpattern;
stim(72).stimulation = 'Amp';
stim(72).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;Eff_curr;0;0;0;0;0;0;0]; %9-1
stim(72).meas_pattern= Measpattern;
stim(73).stimulation = 'Amp';
stim(73).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;Eff_curr;0;0;0;0;0;0]; %10-1
stim(73).meas_pattern= Measpattern;
stim(74).stimulation = 'Amp';
stim(74).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0;0;0]; %11-1
stim(74).meas_pattern= Measpattern;
stim(75).stimulation = 'Amp';
stim(75).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0;0]; %12-1
stim(75).meas_pattern= Measpattern;
stim(76).stimulation = 'Amp';
stim(76).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0]; %13-1
stim(76).meas_pattern= Measpattern;
stim(77).stimulation = 'Amp';
stim(77).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0]; %14-1
stim(77).meas_pattern= Measpattern;
stim(78).stimulation = 'Amp';
stim(78).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0]; %15-1
stim(78).meas_pattern= Measpattern;
stim(79).stimulation = 'Amp';
stim(79).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;0;0;0;Eff_curr]; %16-1
stim(79).meas_pattern= Measpattern;
img.fwd_model.stimulation=stim;



%load data
load('datamat_1_0.mat')
Uel=reshape(Uel,1264,1);
img.elem_data(:) = 1.95;
vh = fwd_solve(img);

norm(Uel-vh.meas)

