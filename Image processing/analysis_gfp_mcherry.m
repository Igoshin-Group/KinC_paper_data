clf;
ana_dir="./";
sig_dir="../Data/PtapA-mCherry-KinA-GFP/signal/";
files=dir(sig_dir+"*.mat");
files={files.name};
strain_map=containers.Map({'11174','11192'},{'wt','dc'});
signal=struct; % strain: signals (list)
signal(1).wt=[];
signal(1).dc=[];
signal(2).wt=[];
signal(2).dc=[];
area=struct; % strain: signals (list)
area(1).wt=[];
area(1).dc=[];


for i = 1:length(files)
filename=files{i};
load(sig_dir+filename,'sig');

strain=filename(1:5);
strain=strain_map(strain);

signal(2).(strain)=[signal(2).(strain) max(0,sig.signal2)];
signal(1).(strain)=[signal(1).(strain) max(0,sig.signal1)];

area(1).(strain)=[area(1).(strain) sig.area];

end


result=struct;
result(1).signal=signal;
result(1).area=area;
%%
As_wt=[];
As_dc=[];
Ts_wt=[];
Ts_dc=[];
Ts_wt=[Ts_wt (signal(2).wt./area(1).wt)];
As_wt=[As_wt (signal(1).wt./area(1).wt)];
Ts_dc=[Ts_dc (signal(2).dc./area(1).dc)];
As_dc=[As_dc (signal(1).dc./area(1).dc)];
figure;
filter=zeros(size(As_dc));
for i =1:length(filter)
    if mod(i,15)==1
        filter(i)=true;
    else filter(i)=false;
    end
end
filter=logical(filter);
length(As_dc(filter))
plot(log10(As_dc(filter)),log10(Ts_dc(filter)),'ro');hold on;
ylim([-2,0])
xlim([-2,0])
filter=zeros(size(As_wt));
for i =1:length(filter)
    if mod(i,4)==1
        filter(i)=true;
    else filter(i)=false;
    end
end
filter=logical(filter);
length(As_wt(filter))

plot(log10(As_wt(filter)),log10(Ts_wt(filter)),'ko'); hold on;
xlabel('KinA')
ylabel("tap")
%%
wt=[As_wt; Ts_wt];
dc=[As_dc; Ts_dc];
wt_mins_bin=[];
dc_mins_bin=[];
edges=10.^([-1.6:0.3:0.2]);


[~,~,bins_wt] = histcounts(wt(1,:),edges);
[~,~,bins_dc] = histcounts(dc(1,:),edges);
err_wt=[];err_dc=[];

for n = 1:length(edges)-1
    length(wt(:,bins_wt==n))
  wt_mins_bin(n,:) = mean(wt(:,bins_wt==n),2);

  err_wt(n)=std(wt(2,bins_wt==n))/length(wt(2,bins_wt==n))^0.5*3;

  dc_mins_bin(n,:) = mean(dc(:,bins_dc==n),2);

  err_dc(n)=std(dc(2,bins_dc==n))/length(wt(2,bins_wt==n))^0.5*3;

end


%%


%%
threshold =0.08;
figure;
for n = 1:length(edges)-1
  wts=wt(2,bins_wt==n);

  wt_fracs(n) = length(wts(wts>threshold))/length(wts);
  wt_int(n)=mean(wts(wts>threshold));
  wts=dc(2,bins_dc==n);
  dc_fracs(n) = length(wts(wts>threshold))/length(wts);
  dc_int(n)=mean(wts(wts>threshold));

end
plot(log10(wt_mins_bin(:,1)),log10(wt_fracs),'ko-');hold on;


plot(log10(dc_mins_bin(:,1)),log10(dc_fracs),'ro-');hold on;

xlim([-1.6,0.2]);

%%
figure;
wt_mins_bin(:,2)=wt_mins_bin(:,2);
errorbar(log10(wt_mins_bin(:,1)),log10(wt_mins_bin(:,2)),log10(wt_mins_bin(:,2))-log10(wt_mins_bin(:,2)-err_wt'),log10(wt_mins_bin(:,2)+err_wt')-log10(wt_mins_bin(:,2)),'ko-','lineWidth',1); hold on;
errorbar(log10(dc_mins_bin(:,1)),log10(dc_mins_bin(:,2)),log10(dc_mins_bin(:,2))-log10(dc_mins_bin(:,2)-err_dc'),log10(dc_mins_bin(:,2)+err_dc')-log10(dc_mins_bin(:,2)),'ro-','lineWidth',1); hold on;
% errorbar(log10(wt_mins_bin(:,1)),(wt_mins_bin(:,2)),err_wt,'ko-','lineWidth',1); hold on;
% errorbar(log10(dc_mins_bin(:,1)),(dc_mins_bin(:,2)),err_dc,'ro-','lineWidth',1); hold on;
plot(log10(wt_mins_bin(:,1)),log10(wt_int),'ko--');hold on;
plot(log10(dc_mins_bin(:,1)),log10(dc_int),'ro--');hold on;
legend('wt','dc')
xlabel('KinA level')
ylabel('tapA level')
% % %
%  hold on ;p1=scatter(log10(As_wt),log10(Ts_wt),'MarkerFaceColor','k','MarkerEdgeAlpha',0,'MarkerFaceAlpha',0.1); hold on;
%  p2=scatter(log10(As_dc),log10(Ts_dc),'o','MarkerFaceColor','r','MarkerEdgeAlpha',0,'MarkerFaceAlpha',0.1);
% % %

xlim([-1.6,0.2]);

%%


bar([1,2],[0.0614,0.0495]) ;hold on;


er = errorbar([1,2],[0.0614,0.0495],[0.0014,0.0011]);
er.Color = [0 0 0];
er.LineStyle = 'none';

hold off
