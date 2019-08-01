function [G]=creatG(windowdatatarget,windowdataTF1,windowdataTF2,windowdatatarget1,windowdatatarget2,h)  
[~,targetnum]=size(windowdatatarget);
[~,TFnum]=size(windowdataTF1);
G = zeros(TFnum,targetnum);
for i=1:targetnum
    for j=1:TFnum
           if i~=j
%             mi=threeorderkernelcmi(windowdatatarget(:,i)',windowdataTF1(:,j)',windowdataTF2(:,j)',windowdataTF3(:,j)',windowdatatarget1(:,i)',windowdatatarget2(:,i)',windowdatatarget3(:,i)',h);
              mi=horderkernelcmi(windowdatatarget(:,i)',windowdataTF1(:,j)',windowdataTF2(:,j)',windowdatatarget1(:,i)',windowdatatarget2(:,i)',h);
%             x0_set={};
%             x1_set={};
%             x1_set{1}=windowdataTF1(:,j)';
%             x0_set{1}=windowdataTF2(:,j)';
%             mi=highorderTE(windowdatatarget(:,i)',x1_set,x0_set,windowdatatarget1(:,i)',windowdatatarget2(:,i)',h);
%               mi=kernelcmi(windowdatay(:,i)',windowdatax1(:,j)',windowdatax1(:,i)',h);
             G(j,i)=mi;

           end
    end
end

