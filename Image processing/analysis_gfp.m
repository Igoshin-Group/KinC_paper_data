clf;
sig_dir="../Data/PtapA-GFP/signal/";
ana_dir="./";
files=dir(sig_dir+"*.mat");
files={files.name};
strain_map=containers.Map({'8771','8957'},{'wt','dc'});
signal=struct; % strain: signals (list)
signal(1).wt={};
signal(1).dc={};
area=struct; % strain: signals (list)
area(1).wt={};
area(1).dc={};
for i = 1:length(files)
filename=files{i};
load(sig_dir+filename,'sig');
tind=regexp(filename,'T[0-9]');
t=str2num(filename(tind+1));
strain=filename(1:4);
strain=strain_map(strain);
if length(signal(1).(strain))<t
    signal(1).(strain){t}=[];
    area(1).(strain){t}=[];
end
signal(1).(strain){t}=[signal(1).(strain){t} sig.signal];
area(1).(strain){t}=[area(1).(strain){t} sig.area];
end
result=struct;
result(1).signal=signal;
result(1).area=area;

ts=[4,6,8];
means=struct;
means(1).wt={};
means(1).dc={};
means(2).wt={};
means(2).dc={};
cells=struct;
cells(1).wt={};
cells(1).dc={};
%%
cut_thres=0.1;
for t=ts
    for strain=["wt","dc"]
        limit=0.1;
        if strain=="dc"
        limit=0.05;
        end
        thres=get_pixel_dist(strain,t)*3;
        sig1s=result(1).signal.(strain){t};
        means(1).(strain){t}= sum(result(1).area.(strain){t}(sig1s>=0).*sig1s(sig1s>=0))/sum(result(1).area.(strain){t}(sig1s>=0));
        means(2).(strain){t}= sum(result(1).area.(strain){t}(sig1s>=thres).*sig1s(sig1s>=thres))/sum(result(1).area.(strain){t}(sig1s>=thres));
        cells(1).(strain){t}=length(sig1s(sig1s>=thres))/length(sig1s);
        [P,X]=histcounts((sig1s(sig1s>=0)),'BinEdges',linspace(0,40,40),'Normalization','probability');
        ha1=subplot(2,1,1);
        XCenter=X(2:end)-(X(2)-X(1))/2;
        length(P)
        PS=max(0,P-limit);
        bar(XCenter,PS,1);
        ylim([0,1.2]);
        xlim([-2,42]);
        set(gca,'YTickLabel',[P(1)]);
        set(gca,'YTick',[PS(1)]);
        set(gca,'XTickLabel',[]);
         pbaspect([3 1 1]);
        ha2=subplot(2,1,2);
        bar(XCenter,P,1);
        ylim([0,limit]);
        xlim([-2,42]);
        pos = get( ha1, 'Position' );
        pos(2)=0.37;
        set( ha1, 'Position' ,pos);
        set(ha1,'DataAspectRatio',[5,1,1]);
%         title(strain+'T'+num2str(t));
        print(gcf,ana_dir+'Final_'+strain+'T'+num2str(t)+'.pdf','-dpdf');
        clf;
    end
end
wt_cells=[cells.wt{ts}];
dc_cells=[cells.dc{ts}];
wt_means=[means(1).wt{ts}];
dc_means=[means(1).dc{ts}];
wt_means2=[means(2).wt{ts}];
dc_means2=[means(2).dc{ts}];
%da_means=[means.da{ts}];
%%
plot(ts,wt_means,'ko-','LineWidth',2);hold on;
plot(ts,dc_means,'ro-','LineWidth',2);hold on;
plot(ts,wt_means2,'ko--','LineWidth',2);hold on;
plot(ts,dc_means2,'ro--','LineWidth',2);hold on;
xlabel('time');
xlim([3.7,8.3]);
ylim([0,15]);
ylabel('mean intensity');
        pbaspect([2 1 1]);

% plot(ts,da_means,'bo-','LineWidth',2);
legend(["wt","dc"]);
saveas(gcf,ana_dir+"tap-means"+'.pdf');
clf;
plot(ts,wt_cells,'kd--','MarkerSize',15,'LineWidth',2);hold on;
plot(ts,dc_cells,'rd--','MarkerSize',15,'LineWidth',2);hold on;
xlim([3.7,8.3]);
xlabel('time');
ylabel('fraction of tapA-expressing cells');
        pbaspect([2 1 1]);
saveas(gcf,ana_dir+"tap-fraction"+'.pdf');
