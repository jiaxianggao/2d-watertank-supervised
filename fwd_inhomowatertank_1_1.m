%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This MATLAB script was written by J. Gao                 %       
% University of Sheffield, United Kingdom                  %
% Please send comments to: jgao47@sheffield.ac.uk          %
%                                                          % 
% This script is 2D forward model for case 1.1 with skip 3 %
% To run this code, get eidors package and dataset         %
% from Finland ready.                                      %
%                                                          % 
% For educational purposes only, the author(s) do not      %
% guarantee that the script is free from errors. Further-  %
% more, the author(s) do not have any liability for issues %
% caused by the use of program.                            % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% run D:\matlabwork\eidors-v3.11-ng\eidors\startup.m

fmdl=mk_common_model('d2d1c',16);
fmdl.fwd_model.nodes = fmdl.fwd_model.nodes*14;
show_fem(fmdl.fwd_model,[1,1]);
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
% img=eidors_obj('image','saline');
% img.fwd_model=fmdl.fwd_model;
% img.elem_data=fmdl.fwd_model.elems(:,1);
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
stim(1).stimulation = 'Amp';
stim(1).stim_pattern= [Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0]; %1-5
stim(1).meas_pattern= Measpattern;
stim(2).stimulation = 'Amp';
stim(2).stim_pattern= [0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0]; %2-6
stim(2).meas_pattern= Measpattern;
stim(3).stimulation = 'Amp';
stim(3).stim_pattern= [0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0]; %3-7
stim(3).meas_pattern= Measpattern;
stim(4).stimulation = 'Amp';
stim(4).stim_pattern= [0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0;0]; %4-8
stim(4).meas_pattern= Measpattern;
stim(5).stimulation = 'Amp';
stim(5).stim_pattern= [0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0;0]; %5-9
stim(5).meas_pattern= Measpattern;
stim(6).stimulation = 'Amp';
stim(6).stim_pattern= [0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0;0]; %6-10
stim(6).meas_pattern= Measpattern;
stim(7).stimulation = 'Amp';
stim(7).stim_pattern= [0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0;0]; %7-11
stim(7).meas_pattern= Measpattern;
stim(8).stimulation = 'Amp';
stim(8).stim_pattern= [0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0;0]; %8-12
stim(8).meas_pattern= Measpattern;
stim(9).stimulation = 'Amp';
stim(9).stim_pattern= [0;0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0;0]; %9-13
stim(9).meas_pattern= Measpattern;
stim(10).stimulation = 'Amp';
stim(10).stim_pattern= [0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0;0]; %10-14
stim(10).meas_pattern= Measpattern;
stim(11).stimulation = 'Amp';
stim(11).stim_pattern= [0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr;0]; %11-15
stim(11).meas_pattern= Measpattern;
stim(12).stimulation = 'Amp';
stim(12).stim_pattern= [0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0;-Eff_curr]; %12-16
stim(12).meas_pattern= Measpattern;
stim(13).stimulation = 'Amp';
stim(13).stim_pattern= [-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0;0]; %13-1
stim(13).meas_pattern= Measpattern;
stim(14).stimulation = 'Amp';
stim(14).stim_pattern= [0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0;0]; %14-2
stim(14).meas_pattern= Measpattern;
stim(15).stimulation = 'Amp';
stim(15).stim_pattern= [0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;Eff_curr;0]; %15-3
stim(15).meas_pattern= Measpattern;
stim(16).stimulation = 'Amp';
stim(16).stim_pattern= [0;0;0;-Eff_curr;0;0;0;0;0;0;0;0;0;0;0;Eff_curr]; %16-4
stim(16).meas_pattern= Measpattern;

%solve all voltage patterns
img.fwd_model.stimulation=stim;
img.fwd_solve.get_all_meas = 1;

%set the conductivity, creating an inhomogeneous model
img.elem_data(:) = 1.96; 
object_1 = '(x-0.0).^2+(y-8.4).^2<2.8^2';
els1 = elem_select(img.fwd_model, object_1);
img.elem_data(find(els1)) = 1e-8;
% show_fem(img);

%solve for voltage distibution V
vh = fwd_solve(img);
% plot(vh.meas);

img_v=rmfield(img,"elem_data");
img_v.node_data=vh.volt(:,1);
show_fem(img_v,[1,1]) %show voltage
figure(2)
show_current(img,vh.volt(:,2))

%load data

% load('datamat_1_1.mat')
% Uel=reshape(Uel,1264,1);
% Uel = Uel(769:1024); %skip3
% hold on
% 
% plot(Uel);
% title('measurements on electrodes');
% legend('voltage by simulation','voltage by experiment');