%% created on 11/11/2020- By Rajan Kashyap @ clinical Brain Lab (CBL)
% Purpose: To create the individual fMRI subspace of a subject
%
% Input- Provide the preprocessed and atlas parcellated resting state fMRI of all subjects
% Output- the code will create the (1)individual fMRI subpace 
%(2)Individual connectome based on Pearson's correlation
%
% If you are using this code please cite
%(1)Kashyap, R. et al, Individual-specific fMRI-Subspaces improve functional connectivity prediction of behavior. NeuroImage 189, 804–812 (2019).
%(2)Zhou, G., Cichocki, A., Zhang, Y. & Mandic, D. P. Group Component Analysis for Multiblock Data: Common and Individual Feature Extraction. IEEE Transactions on Neural Networks and Learning Systems 27, 2426–2439 (2016).


clear all;
p = 'N:\2019_ocdcomp\Code_Github\Utilities'; % Please choose your own path
addpath (genpath(p));
%% Dynamic loading of the path
Total_Number_of_Subject_per_group = N;
All_Subjects= cell (1,1);
 for i = 1:N 
% Chose the path of your preprocesed data
Info.wdir = 'N:\2019_ocdcomp\data_conn\resting\20190628\Revision_Data\conn_project06_20OCD22HC_FDcovariate\results\preprocessing\';
matfile = [ 'ROI_Subject0', num2str(i, '%02i') ,'_Condition000.mat' ]; 
load([Info.wdir matfile]);
%% Getting the Bold Time Series of a subject for all cortical and subcortical areas
Bold_Time_Series_Cortical = [];
%Cort_names = {};
for j = 198:329              % as per atlas used
    A = data {j};
    Bold_Time_Series_Cortical = [Bold_Time_Series_Cortical, A];
end
%i= i-22;
 All_Subjects{1,i} = Bold_Time_Series_Cortical; 
 end
% Path where you wish to store your files 
mkdir('N:\2019_ocdcomp\COBE_data\Revision_Data\Control\');
Output_dir ='N:\2019_ocdcomp\COBE_data\Revision_Data\Control';
Output_Name1= 'All_Subject_Parcellated_TimeSeries';
save (fullfile(Output_dir,[Output_Name1 '.mat']), 'All_Subjects','-v7.3'  );
%%%%%%%-----------------------%%%%%%%%%%%%%%%%%%
% Load preproceed data (if you have already preprocesed and atlas
% parcellated the data- Please put the data in a cell)
clear all;
load ('N:\2019_ocdcomp\COBE_data\Old\OCD\All_Subject_Parcellated_TimeSeries.mat');

%% COBE Part Starts Here
Component_remv= 1;
[ COBE_CM_Component, COBE_TimeCourses_Individual_Subj,COBE_Correlation_Common_FunctionalConnectome, COBE_Correlation_Individual_FunctionalConnectome, ~ ] = CBL_Obtain_COBE_Normal_Corr_Data( All_Subjects,Component_remv );
   
%% Assign the directory
% Change the name here based on the number of components removed
mkdir('N:\2019_ocdcomp\COBE_Output\Revision_data\Component_1\OCD\');
Output_dir ='N:\2019_ocdcomp\COBE_Output\Revision_data\Component_1\OCD';

Output_Name1= 'COBE_Common_Data';
save (fullfile(Output_dir,[Output_Name1 '.mat']),'COBE_CM_Component','Component_remv', 'COBE_TimeCourses_Individual_Subj' );

Output_Name3= 'COBE_Corr_Data';
save (fullfile(Output_dir,[Output_Name3 '.mat']),'COBE_Correlation_Individual_FunctionalConnectome','-v7.3' );

% Output_Name4= 'Orig_Corr_Data';
% save (fullfile(Output_dir,[Output_Name4 '.mat']),'Orig_FunctionalConnectome','-v7.3' );
