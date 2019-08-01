function [lag_matric]  = createTime_lag(expmat,sample,time_lag)
    lag_matric={};%1表示time_lag~T时间
    [m,n]=size(expmat);
    for i=1:(time_lag+1)
        s_len=m/sample;
        tmp=[];
        for j=1:sample
            start=time_lag+2-i+(j-1)*s_len;
            endx=j*s_len-(i-1);
            tmp=[tmp;expmat(start:endx,:)];
        end
        lag_matric{i}=tmp;
    end
end