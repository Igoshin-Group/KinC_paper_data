set(0, 'DefaultLineLineWidth', 1);
msggwttap=[38.19,55.01,124.79,253.14,346.42,436.75];msggwttaperr=[0.25, 7.52, 12.74, 24.45, 25.14, 45.54];
msggdctap=[8.79,10.38,27.90,126.15,192.33,186.51];msggdctaperr=[0.92, 7.51, 29.07, 9.39, 17.02, 28.76];
msggdatap=[27.64,34.48,62.94,80.49,96.51,95.48];msggdataperr=[1.02, 2.21, 5.85, 4.95, 27.08, 26.75];


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
sporemsgg=[ 194833 2955 12583333 0 328250000 185250  229000000];
viablemsgg=[482000000 619333333.3 582000000 0 546750000 517500000 497250000];
errviable=[50931326	218138335	304116754 0 107766337 102802399 53922012];
errmsgg=[96410	1592	10414493 0 75433746 34326 23508864];

bars=[];errs=[];
for i =1:7
bars=[bars,sporemsgg(i),viablemsgg(i)];
errs=[errs,errmsgg(i),errviable(i)];
end


errlow=log10(bars)-log10(bars-errs);
errhigh=log10(bars+errs)-log10(bars);


xx=[1,2,3.5,4.5,6,7,8,9,10,11,12.5,13.5,15,16];
bar(xx,log10(bars))  
hold on;
er = errorbar(xx,log10(bars),errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
ylim([2 10])
ylabel('Counts')

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

%%
msggdcdstap=[83, 200, 324, 777, 1302, 1405];
msggdstap=[165, 286, 376, 800, 1130, 1192];
ts=3:8;
wt=plot(ts,msggwttap,'-ok','MarkerSize',10);
hold on;
dc=plot(ts,msggdctap,'rs-','MarkerSize',10);
hold on;
ds=plot(ts,msggdstap,'ko--','MarkerSize',10);
xlim([3,8]);
dcds=plot(ts,msggdcdstap,'rs--','MarkerSize',10);
legend([wt,dc,ds,dcds],'wt','Î”kinC','Î”sda','Î”kinCÎ”sda');
xlabel('time(h)')
ylabel('tapA promoter activity (MU)')

%%
w=[20.85	41.03	170.17	316.79	449.84	504.07]	;
a=[18.41	23.21	51.49	119.83	139.82	154.13	];
b=[32.80	46.67	80.94	196.38	230.17	242.59];
c=[4.72	8.00	73.77	160.31	217.20	213.37	];
d=[39.95	77.25	255.37	301.69	415.29	504.75	];
t=3:8;
we=[2.95	4.47	17.98	43.88	86.13	86.76];
ae=[2.76	3.79	13.10	19.96	27.67	20.06];
be=[9.81	12.46	10.11	62.68	62.01	30.60];
ce=[1.34	2.40	24.30	36.07	47.05	65.87];
de=[10.76	11.07	45.84	53.32	61.56	47.78];

errorbar(t,w,we,'ko-');hold on;
errorbar(t,a,ae,'ro-');hold on;
errorbar(t,b,be,'go-');hold on;
errorbar(t,c,ce,'bo-');hold on;

%%
errorbar(t,w,we,'ko-');hold on;
errorbar(t,d,de,'ro-');hold on;


