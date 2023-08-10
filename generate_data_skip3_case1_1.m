% skip3 simulation pattern for case 1.1 20/05/2023
clear
% run D:\matlabwork\eidors-v3.11-ng\eidors\startup.m

fmdl= mk_common_model('d2d1c',16); % 'd2d1c' around 3000 cells
fmdl.fwd_model.nodes = fmdl.fwd_model.nodes*14;

% Stimulation & measurement patterns
Eff_curr=2/sqrt(2); %the effective value of alternating current 
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

fmdl.fwd_model.stimulation = stim;

% Create an homogeneous image
img = mk_image(fmdl);
img.fwd_solve.get_all_meas = 1;

% Generate training data

N=1; % num of samples
num_els = length(img.elem_data);
num_meas = size(stim,2)*16;

features=zeros(num_meas,N);
labels=zeros(num_els,N);

% centroid of circle inclusions
x0=0;
y0=0;
R=11.2;
num_Dian=N;
theta=0:0.001:360;
Circle1=x0+R*cos(theta);
Circle2=y0+R*sin(theta);
r=R*sqrt(rand(1,num_Dian));
seta=2*pi*rand(1,num_Dian);
x_inclu=x0+r.*cos(seta);
y_inclu=y0+r.*sin(seta);

% electrode voltages, conductivity values, and interal voltages
for j=1:N
    obj_pl=sprintf('(x-%f).^2+(y-%f).^2<2.8^2', x_inclu(j), y_inclu(j));
    els1 = elem_select(img.fwd_model,obj_pl);
    img.elem_data(:) = 1.96; %homo conductivity
    img.elem_data(find(els1))=1e-8; %conductivity of plastic
    labels(:,j) = img.elem_data;
    UC=fwd_solve(img);
    UCel=UC.meas;
    features(:,j)=UCel;
end


% Load experiment data
load('datamat_1_1.mat')
Uel=reshape(Uel,1264,1);
Uel = Uel(769:1024); %skip3
% 
% save('case1_1_skip3_fn_10000.mat','features',"labels","Uel","img")