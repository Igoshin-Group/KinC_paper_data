n=config('Spo0A_alter.txt');

dh=[];cs=[];as=[];
gr=0.5;
vcs=logspace(-1.3,0.35,100);
vas=logspace(-2,0.47,100);

for i=1:length(vas)
 for j=1:length(vcs)
     va=vas(i);vc=vcs(j);
xi=zeros(1,n);
 [t,y]=ode15s(@(t,x)Spo0A_full(t,x,gr,va,vc),[0,20],xi);
dh(i,j)=y(end,16)./(y(end,15)+y(end,16)+y(end,17)+y(end,20));

if i==1
cs=[cs (y(end,5)+y(end,6)+y(end,7))];
end
 end
 as=[as (y(end,2)+y(end,3)+y(end,4))];

 i
end


save('heatmap_alter.mat','dh','cs','as')



%%
heatmap(cs,flip(as),flip(dh),'GridVisible','off') ;
map = [0.5 0 0.3
    1 0 0.4
    0 0 0.5
    0 0 0.6
    0 0 0.8
    0 0 1.0];
colormap(cmap);

xlabel('[KinC]');
ylabel('[KinA]');

%%
hold on;
[X,Y] = meshgrid((cs),(as));
colormap(cmap)
[c,h]=contourf(X,flip(Y),flip(dh),[0.1,0.2,0.3,0.4,0.5],'k--');set(gca, 'YScale', 'log');
%clabel(c,h,'manual');
set(gca, 'XScale', 'log');
%set(h,'LineColor','none')

colorbar;       