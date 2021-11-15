clf;
para=[0.98,2.667,8.25,4423,5958,1,0.2];
va=4;vc=2.7;
%      para=ans;
temp = num2cell(para);
[nt,kg,kt,scaleg,scalet,vs,p0e] = deal(temp{:});
msggwttap=[38.19,55.01,124.79,253.14,346.42,436.75];msggwttaperr=[0.25, 7.52, 12.74, 24.45, 25.14, 45.54];
msggdctap=[8.79,10.38,27.90,126.15,192.33,186.51];msggdctaperr=[0.92, 7.51, 29.07, 9.39, 17.02, 28.76];
msggdatap=[27.64,34.48,62.94,80.49,96.51,95.48];msggdataperr=[1.02, 2.21, 5.85, 4.95, 27.08, 26.75];
msggwtiig=[0,0,0,19.80,37.39,42.53];msggwtiigerr=[0, 0, 0, 1.80, 14.53, 19.66];
msggdaiig=[0,0,0,0.62,0.74,0.97];msggdaiigerr=[0, 0, 0, 0.43, 0.10, 0.13];
msggdciig=[0,0,0,64.86,115.37,174.55];msggdciigerr=[0, 0, 0, 14.83, 10.26, 16.72];
%%
wtt=[];dat=[];dct=[];tt=3:0.2:9;ts=[3,4,5,6,7,8];
 wta=[];daa=[];dca=[];wtg=[];dag=[];dcg=[];for t=tt
   gr=gr_t(t);
    wtt=[wtt fss_fit([21],gr,va,vc,vs,kg,kt,nt,p0e)];
    dat=[dat fss_fit([21],gr,0,vc,vs,kg,kt,nt,p0e)];
    dct=[dct fss_fit([21],gr,va,0,vs,kg,kt,nt,p0e)];
end
%%
figure;k=5487;errorbar(ts,msggwttap,msggwttaperr,'k','LineStyle', 'none','LineWidth',1);hold on;wt=plot(ts,msggwttap,'ko','MarkerSize',10,'MarkerFaceColor','white');hold on;
errorbar(ts,msggdctap,msggdctaperr,'r','LineStyle', 'none','LineWidth',1);hold on;dc=plot(ts,msggdctap,'rs','MarkerSize',10,'MarkerFaceColor','white');hold on; 
errorbar(ts,msggdatap,msggdataperr,'b','LineStyle', 'none','LineWidth',1);hold on;da=plot(ts,msggdatap,'bd','MarkerSize',10,'MarkerFaceColor','white'); hold on;
plot(tt,wtt.*k,'k-');hold on;plot(tt,dct.*k,'r-');hold on; plot(tt,dat.*k,'b-'); hold on;
xlim([3,8]);
 ylim([0,600]);
legend([wt,dc,da],'wt','dkinC','dkinA');
xlabel('time(h)');
ylabel('tapA promoter activity');
