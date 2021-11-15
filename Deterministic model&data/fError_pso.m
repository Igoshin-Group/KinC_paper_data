function err = fError(para)
temp = num2cell(para);
[nt,kg,kt,scaleg,scalet,vs,p0e,va,vc] = deal(temp{:});
 %va=4;vc=2.7;
msggwttap=[38.19,55.01,124.79,253.14,346.42,436.75];msggwttaperr=[0.25, 7.52, 12.74, 24.45, 25.14, 45.54];
msggdctap=[8.79,10.38,27.90,126.15,192.33,186.51];msggdctaperr=[0.92, 7.51, 29.07, 9.39, 17.02, 28.76];
msggdatap=[27.64,34.48,62.94,80.49,96.51,95.48];msggdataperr=[1.02, 2.21, 5.85, 4.95, 27.08, 26.75];
msggwtiig=[0,0,0,19.80,37.39,42.53];msggwtiigerr=[0, 0, 0, 1.80, 14.53, 19.66];
msggdaiig=[0,0,0,0.62,0.74,0.97];msggdaiigerr=[0, 0, 0, 0.43, 0.10, 0.13];
msggdciig=[0,0,0,64.86,115.37,174.55];msggdciigerr=[0, 0, 0, 14.83, 10.26, 16.72];
ts=[3,4,5,6,7,8];
wtt=[];
wtg=[];
dat=[];
dag=[];
dct=[];
dcg=[];

for tt=ts
gr=gr_t(tt);
gt= fss_fit([1,21],gr,va,vc,vs,kg,kt,nt,p0e);
g=gt(1);
t=gt(2);
wtt=[wtt t];wtg=[wtg g];
gt= fss_fit([1,21],gr,0,vc,vs,kg,kt,nt,p0e);
g=gt(1);
t=gt(2);
dat=[dat t];dag=[dag g];
gt= fss_fit([1,21],gr,va,0,vs,kg,kt,nt,p0e);
g=gt(1);
t=gt(2);

dct=[dct t];dcg=[dcg g];
end
fe=@(x,y)mean((x-y).^2);

  err=fe(wtg.*scaleg,msggwtiig)+fe(dcg.*scaleg,msggdciig)+fe(dag.*scaleg,msggdaiig)+...
 fe(wtt.*scalet,msggwttap)+fe(dat.*scalet,msggdatap);
end

