function [G]=creatGcmi(G,windowdatay,windowdatax1,windowdatax2,h,lamda2)  
% 对zeroorder 网络G 通过 causation entropy过滤间接调控的边
[~,col]=size(windowdatay);

              

for i=1:col
      for j=1:col
          if G(i,j)~=0
              adj_gene_set=[] ;
              for k=1:col
                  if G(i,k)~=0 && G(k,j)~=0
                      adj_gene_set=[adj_gene_set,k] ;
                  end
              end
              if size(adj_gene_set,2)>=1
                   adj_num=size(adj_gene_set,1);   
                   ce_value=0;
                   for n=1:adj_num
                        k=adj_gene_set(n);  
                        CEscore=horderkernelcmi(windowdatay(:,j)',windowdatax1(:,i)',windowdatax2(:,i)',windowdatax1(:,k)',windowdatax2(:,k)',h);
                        a=CEscore ;
                        cemax=max(ce_value,a);
                   end
                   if cemax<lamda2
                       G(i,j)=0;
                   end
              end
          end
      end
end   
