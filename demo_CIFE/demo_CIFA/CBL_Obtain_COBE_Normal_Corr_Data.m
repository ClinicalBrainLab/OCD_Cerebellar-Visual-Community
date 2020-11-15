


function [ CM_run_COBE_Data, Q_run,Corr_Common_cell_run, Corr_Indiv_run_COBE, Corr_Orig_run ] = CBL_Obtain_COBE_Normal_Corr_Data( Time_Course_run,Component_remv )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%Getting the Time-Courses of all the Subjects kept in a folder 
% files_loc1 = dir (Subjects_TC_location);
% files_loc1 = files_loc1(3: size (files_loc1),:);
% A = {files_loc1.name}';
% path_location1 = Subjects_TC_location;
% Time_Course_run = cell (size(A,1), 1);
% 
% for i = 1: length (A)    
%     
%     U1=load([path_location1 '/' files_loc1(i).name]); 
%     Time_Course_run{i,1} = [];
%     Bold_Time_Series_Cortical = [];
% %Cort_names = {};
% for j = 4:119
%     B = U1.data {j};
%     Bold_Time_Series_Cortical = [Bold_Time_Series_Cortical, B];
%    
% end
%     Time_Course_run{i,1} = Bold_Time_Series_Cortical;
%     
%     
% end
% For changing the matrix dimensionfrom [Timecourse x Spatial Areas] to [Spatial Areas x
% TimeCourse]
% for i = 1 : length (Time_Course_run)
%     Time_Course_run{i} = Time_Course_run{i}';
% end
%For changing the matrix dimensionfrom [Timecourse x Spatial Areas] to [Spatial Areas x
% TimeCourse]

A = length (Time_Course_run);
for i = 1 : length (Time_Course_run)
    Time_Course_run{i} = Time_Course_run{i}';
end
%%if Z Normalisation is required
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Time_Course_run_normalised = cell (A, 1);

for i = 1: length (Time_Course_run)
    X =Time_Course_run {1,i};
    A = zscore (X);
%     A = A';
    Time_Course_run_normalised{i,1} = A;
end
Time_Course_run = Time_Course_run_normalised;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Getting the components to be removed and the applying COBE
rC =  Component_remv;
opts.c = rC;
[CM_run_COBE_Data, Q_run] = cobec(Time_Course_run, opts);
% getting the common values
Common_cell_run= cell(1,1);
for i= 1: length(Q_run)
    %i =i-22;
    M= CM_run_COBE_Data* Q_run{1,i};
    Common_cell_run{i,1}= M;
end
%getting the correlation values of common signal
Corr_Common_cell_run= cell(1,1);
for i= 1: length (Common_cell_run)
    M= corr(Common_cell_run{i,1}');
    Corr_Common_cell_run{i,1}= M;
end
%getting the Individual values
Indiv_cell_run= cell(1,1);
for i= 1: length (Common_cell_run)
    M= Time_Course_run{i,1}-Common_cell_run{i,1};
    Indiv_cell_run{i,1}= M;
end
% getting the Individual correlation matrices
Corr_Indiv_run_COBE= cell(1,1);
for i= 1: length(Indiv_cell_run)
    M= corr (Indiv_cell_run{i,1}');
    Corr_Indiv_run_COBE{i,1}= M;
end
%Getting the original matrices
Corr_Orig_run= cell(1,1);
for i= 1: length(Time_Course_run)
    M= corr (Time_Course_run{i,1}');
    Corr_Orig_run{i,1}= M;
end

end

