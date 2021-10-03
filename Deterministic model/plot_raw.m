set(0, 'DefaultLineLineWidth', 1);
msggwttap=[38.19,55.01,124.79,253.14,346.42,436.75];msggwttaperr=[0.25, 7.52, 12.74, 24.45, 25.14, 45.54];
msggdctap=[8.79,10.38,27.90,126.15,192.33,186.51];msggdctaperr=[0.92, 7.51, 29.07, 9.39, 17.02, 28.76];
msggdatap=[27.64,34.48,62.94,80.49,96.51,95.48];msggdataperr=[1.02, 2.21, 5.85, 4.95, 27.08, 26.75];
msggdbtap=[56.3446  118.3788  244.0642  323.8138  344.2484  398.1495];msggdbtaperr=[1.12,0.70,8.68,16.62,19.67,18.52];

msggwtiig=[0,0,0,19.80,37.39,42.53];msggwtiigerr=[0, 0, 0, 1.80, 14.53, 19.66];
msggdaiig=[0,0,0,0.62,0.74,0.97];msggdaiigerr=[0, 0, 0, 0.43, 0.10, 0.13];
msggdciig=[0,0,0,64.86,115.37,174.55];msggdciigerr=[0, 0, 0, 14.83, 10.26, 16.72];
ts=[3,4,5,6,7,8];
k=800;
errorbar(ts,msggwtiig,msggwtiigerr,'k','LineWidth',1);hold on;
wt=plot(ts,msggwtiig,'-ok','MarkerSize',10,'MarkerFaceColor','white');
hold on;
errorbar(ts,msggdciig,msggdciigerr,'r','LineWidth',1);hold on;
dc=plot(ts,msggdciig,'rs-','MarkerSize',10,'MarkerFaceColor','white');
hold on;
errorbar(ts,msggdaiig,msggdaiigerr,'b','LineWidth',1);hold on;
da=plot(ts,msggdaiig,'bd-','MarkerSize',10,'MarkerFaceColor','white');

xlim([3,8]);
legend([wt,dc,da],'wt','¦¤kinC','¦¤kinA');
xlabel('time(h)');
ylabel('SpoIIG promoter activity');

figure;
errorbar(ts,msggwttap,msggwttaperr,'k','LineWidth',1);hold on;
wt=plot(ts,msggwttap,'ko-','MarkerSize',10,'MarkerFaceColor','white');hold on;
errorbar(ts,msggdctap,msggdctaperr,'r','LineWidth',1);hold on;
dc=plot(ts,msggdctap,'rs-','MarkerSize',10,'MarkerFaceColor','white');hold on;
errorbar(ts,msggdatap,msggdataperr,'b','LineWidth',1);hold on;
da=plot(ts,msggdatap,'bd-','MarkerSize',10,'MarkerFaceColor','white');
xlim([3,8]);ylim([0,500]);
legend([wt,dc,da],'wt','¦¤kinC','¦¤kinA');
xlabel('time(h)');
ylabel('tapA promoter activity');



%%
sporemsgg=[ 194833 2955 12583333 0 0 328250000 185250  229000000];
errmsgg=[96410	1592	10414493 0 0 75433746 34326 23508864];

errlow=log10(sporemsgg)-log10(sporemsgg-errmsgg);
errhigh=log10(sporemsgg+errmsgg)-log10(sporemsgg);

bar(log10(sporemsgg))  
hold on;
er = errorbar(1:8,log10(sporemsgg),errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
ylim([2 10])
ylabel('Spore counts')

%%
ikinA=[194.29	431.28	540.68	995.77	1279.32	1328.91];
wt=plot(ts,msggwttap,'ko-');
hold on;
ia=plot(ts,ikinA,'bd-','MarkerSize',10);
hold on;
xlabel('time(h)');
ylabel('tapA promoter activity(MU)');
legend([wt,ia],'wt','kinA-induced');
%%
msggdcdstap=[83, 200, 324, 777, 1302, 1405];
msggdstap=[165, 286, 376, 800, 1130, 1192];
wt=plot(ts,msggwttap,'-ok','MarkerSize',10);
hold on;
dc=plot(ts,msggdctap,'rs-','MarkerSize',10);
hold on;
ds=plot(ts,msggdstap,'ko--','MarkerSize',10);
xlim([3,8]);
dcds=plot(ts,msggdcdstap,'rs--','MarkerSize',10);
legend([wt,dc,ds,dcds],'wt','¦¤kinC','¦¤sda','¦¤kinC¦¤sda');
xlabel('time(h)')
ylabel('tapA promoter activity (MU)')

%%
msggwttap=[38.19,55.01,124.79,253.14,346.42,436.75];msggwttaperr=[0.25, 7.52, 12.74, 24.45, 25.14, 45.54];
msggdbtap=[39.3446 58.18 130.9723  270.0284  358.2621  380.8705 ];msggdbtaperr=[1.4843    0.9277   11.5030   22.0253   26.0672   24.5432];
errorbar(ts,msggwttap,msggwttaperr,'k','LineWidth',1);hold on;
wt=plot(ts,msggwttap,'-ok','MarkerSize',10,'MarkerFaceColor','white');
hold on;
errorbar(ts,msggdbtap,msggdbtaperr,'g','LineWidth',1);hold on;
db=plot(ts,msggdbtap,'gs-','MarkerSize',10,'MarkerFaceColor','white');
hold on;
legend([wt,db],'wt','¦¤kinb');
%%
wt_od1=[0.42	1.36	2.76	3.46	4.25	5.32	5.74	7.21];
wt_od2=[0.56	1.52	2.74	3.65	4.57	5.81	6.69	7.21];
wt_od3=[0.74	1.88	3.32	4.15	5.46	6.54	7.49	7.80];

dc_od1=[0.45	1.49	2.58	3.95	5.13	6.36	7.84	7.26];
dc_od2=[0.55	1.70	3.43	4.37	5.47	7.23	7.68    8.26];
dc_od3=[0.27	1.44	2.97	3.67	4.31	5.54	6.27	7.01];

da_od1=[0.26	1.66	4.22	5.35	6.91	7.38	7.79	7.83];
da_od2=[0.27	1.39	2.80	3.90	5.53	6.24	7.06	7.04];
da_od3=[0.16	0.73	2.58	3.87	4.59	5.39	6.51	6.92];

ts=[1,2,3,4,5,6,7,8];
wt=mean([wt_od1;wt_od2;wt_od3]);
wt_err=std([wt_od1;wt_od2;wt_od3]);
da=mean([da_od1;da_od2;da_od3]);
da_err=std([da_od1;da_od2;da_od3]);
dc=mean([dc_od1;dc_od2;dc_od3]);
dc_err=std([dc_od1;dc_od2;dc_od3]);

errorbar(ts,wt,wt_err,'k','LineWidth',1);hold on;
hold on;
errorbar(ts,dc,dc_err,'r','LineWidth',1);hold on;
hold on;
errorbar(ts,da,da_err,'b','LineWidth',1);hold on;
hold on;
legend('wt','dc','da');
