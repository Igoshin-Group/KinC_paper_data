n=config('Spo0A_fit.txt');
 %Set Phosphorelay Parameters
 tA=[];
 tC=[];
tt=3:0.5:8;

 grs=gr_t(tt);
for gr =grs
  
   Cc=sum(fss_fit([3,9],gr,4,2.7,1,1,1,1,0.2));
   
Aa=sum(fss_fit([2,3,4,5],gr,4,2.7,1,1,1,1,0.2));

tA=[tA mean(Aa)];
 tC=[tC mean(Cc)];
 
end
 
  figure(1)


%%
 plot(grs,tA,'r');hold on ; 
plot(grs,(tC),'g');
xlabel("growth rate(1/h)")
 ylabel("total concentration")
xlim([0.1,0.7])
legend("KinA","Sda")
%%
 plot(tt,tA,'r');hold on ; 
plot(tt,(tC),'g');
xlabel("time(h)")
 ylabel("total concentration")
xlim([3,8])
legend("KinA","Sda")