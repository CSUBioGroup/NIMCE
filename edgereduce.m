function [G]=edgereduce(data,G_zero_order,timepoint,window_num,time_lag,h,lamda2)  
[row,col]=size(data);
% %������ֵlamda1���˵͸��ʵı�
G_1d=sort(G_zero_order(:));

[~,Ctrs] = kmeans(G_1d,2,'Start','uniform','Replicates',3);
lamda1=(Ctrs(1)+Ctrs(2))/2;

for i=1:col
    for j=1:col
        if G_zero_order(i,j)<lamda1
            G_zero_order(i,j)=0;
        end
    end
end

nsample=row/timepoint;
window_data=createTime_lag(data,nsample,window_num-1);  %����������Ŀ�ʹ��������������ڵ�����
%
% ������G_zero_orderͨ��Causion entropy���˼�ӵ��صı�,�õ�G

for ws=1:window_num
    for we=1:window_num
        if (we-ws)==time_lag
            
            G=creatGcmi(G_zero_order,window_data{ws},window_data{ws+1},window_data{ws+2},h,lamda2);
        end
    end    
end
