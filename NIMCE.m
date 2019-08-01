function [G]=NIMCE(data,timepoint,window_num,time_lag,h,lamda2)  
[row,~]=size(data);
nsample=row/timepoint;
window_data=createTime_lag(data,nsample,window_num-1);  %根据样本数目和窗口数量创建窗口的样本
% window_datatarget=createTime_lag(datatarget,nsample,window_num-1);


%对每个满足窗口Wy-Wx=time_lag的窗口，推断子网络


for ws=1:window_num
    for we=1:window_num
        if (we-ws)==time_lag
                     G_zero_order=creatG(window_data{ws},window_data{ws+1},window_data{we},window_data{ws+1},window_data{we},h);
        end
    end
end

%通过阈值和causion entropy过滤间接调控的边
G=edgereduce(data,G_zero_order,timepoint,window_num,time_lag,h,lamda2);

