mean_gr=0.3;
gr=1./normrnd(1./mean_gr,1./mean_gr*0.25,[10000,1]);

[N,edges] = histcounts(gr, 'BinEdges',linspace(0, 1, 80), 'Normalization','pdf');
edges = edges(2:end) - (edges(2)-edges(1))/2;
plot(edges, N);
xlabel('growth rate');
ylabel('Probability Density');
%%
va=4;vc=2.7;vs=1;
warning('off','all');grs=0.1:0.05:1.5;ap1=[];ap2=[];
for g=grs
ap1=[ap1 fss_fit([11],g,va,vc,vs,1,1,1,0.2)];
ap2=[ap2 fss_fit([11],g,va,0,vs,1,1,1,0.2)];
end

mean_gr=0.5;gr=1./normrnd(1./mean_gr,1./mean_gr*0.25,[50000,1]); awt=interp1(grs,ap1,gr).*1.3;
adc=interp1(grs,ap2,gr).*1.5;
gr=gr((~isnan(awt)));
awt=awt(~isnan(awt));
adc=adc(~isnan(adc));
grc=gr;cc=0;kd=1;cc2=0;

mean(adc)
std(adc)/mean(adc)
mean(awt)
std(awt)/mean(awt)
figure;
histogram((adc), 'BinEdges',linspace(0, 1.5, 20),'FaceAlpha',0.5,'Normalization','probability');hold on;
histogram((awt), 'BinEdges',linspace(0, 1.5, 20),'FaceAlpha',0.5,'Normalization','probability');
ylabel('Probability');
yyaxis right;
xlim([-0.05,1.6])
nt=4;ng=4;kt=0.15;kg=1.2;kd=1;
ftap=@(ap)(ap.^nt)./(ap.^nt+kt^nt);
fiig=@(ap)(ap.^ng)./(ap.^ng+kg^ng);
gg=linspace(0, 1.7, 30);
plot(gg,ftap(gg),'r-');hold on;
 plot(gg,fiig(gg),'r-');hold on;

ylim([0,2]);
xlabel('[0A~P]');
ylabel('Promoter activity');
legend("dkinC","WT")
%%

figure;
tapdc=ftap(adc).*fglobal(grc,0.8)./(kd+grc);
tapwt=ftap(awt).*fglobal(gr,0.8)./(kd+gr);
histogram(tapdc, 'BinEdges',linspace(0, 3, 20),'FaceAlpha',0.5,'Normalization','probability');hold on;
histogram(tapwt, 'BinEdges',linspace(0, 3, 20),'FaceAlpha',0.5,'Normalization','probability');
mean(tapdc)
mean(tapwt)
xlabel('tapA promoter activity');
ylabel('Probability');
%%

figure;
iigdc=fiig(adc).*fglobal(grc,0.8)./(kd+grc);
iigwt=fiig(awt).*fglobal(gr,0.8)./(kd+gr);
ha1=subplot(2,1,1);
h=histogram(iigdc, 'BinEdges',linspace(0, 2.4, 20),'FaceAlpha',0.4,'Normalization','probability');hold on;
h2=histogram(iigwt, 'BinEdges',linspace(0, 2.4, 20),'FaceAlpha',0.4,'Normalization','probability');
ylim([0.6,1])
set(gca,'YTickLabel',[h.Values(1),h2.Values(1)])
set(gca,'YTick',[h.Values(1),h2.Values(1)])
set(gca,'XTickLabel',[]);
ha2=subplot(2,1,2);
histogram(iigdc, 'BinEdges',linspace(0, 2.4, 20),'FaceAlpha',0.4,'Normalization','probability');hold on;
histogram(iigwt, 'BinEdges',linspace(0, 2.4, 20),'FaceAlpha',0.4,'Normalization','probability');
ylim([0,0.1])
mean(iigdc)
mean(iigwt)
xlabel('SpoIIG promoter activity');
ylabel('Probability');

%%
figure;
plot(sort(iigwt),sort(tapwt),'b-'); hold on;
plot(sort(iigdc),sort(tapdc),'r-');