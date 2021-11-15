
 tA=[];
 tC=[];
tt=3:0.2:8;

 grs=gr_t(tt);
for gr =grs

   Cc=sum(fss_fit([6,7,8],gr,4,2.7,1,1,1,1,0.2));

Aa=sum(fss_fit([2,4,5],gr,4,2.7,1,1,1,1,0.2));

tA=[tA mean(Aa)];
 tC=[tC mean(Cc)];

end

  figure(1)


%%
plot(tt,tA,'r');hold on ;
plot(tt,tC,'g');
yyaxis right;
plot(tt,gr_t(tt),'g');
