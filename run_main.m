
%data=data;
clear; clc;
%rime clock
tStart = tic;
comparedata={'insilico_size100_1_timeseries';};

%读取数据
load (comparedata{1});
% load (comparedata{2});
data=insilico_size100_1_timeseries; 
% datatarget=colom_634_target_normal_dataexp;
%算法主程序
window_num=3;
time_lag=2;
h=0.45;
timepoint=21;
[G]=NIMCE(data,timepoint,window_num,time_lag,h,0.04);
%讲结果存为一个以‘\t’为间隔的txt文件，注意改路径
dlmwrite(['C:\Users\fhnxi\Desktop\NIMCE\结果\','NIMCE_',comparedata{1},'.txt'], G, 'delimiter', '\t','precision',100,'newline', 'pc')
% running time
toc(tStart)
