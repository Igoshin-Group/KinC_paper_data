n=config('Spo0A_alter.txt');
d=[];
ds=[];
dss=[];
gr=0.5;
vcs=0:0.05:2;
 for vc=vcs
xi=zeros(1,n);
 [t,y]=ode15s(@(t,x)Spo0A_full(t,x,gr,3,vc),[0,20],xi);
d=[d  y(end,16)./(y(end,15)+y(end,16)+y(end,17)+y(end,20))];
 end
 cs=[];
 for vc=vcs
xi=zeros(1,n);
 [t,y]=ode15s(@(t,x)Spo0A_full(t,x,gr,0.01,vc),[0,20],xi);
ds=[ds  y(end,16)./(y(end,15)+y(end,16)+y(end,17)+y(end,20))];
cs=[cs (y(end,5)+y(end,6)+y(end,7))];
 end

%%
plot(cs,d);hold on;
plot(cs,ds);hold on;
legend('High KinA','Low KinA');
xlabel('[KinC]');
ylabel('[Spo0A~P]/[Spo0A]total');
xlim([0,6]);
%%
vas=0.1:0.5:3;
for va=vas 
    d=[];
for vc=vcs

xi=zeros(1,n);
 [t,y]=ode15s(@(t,x)Spo0A_full(t,x,gr,va,vc),[0,20],xi);
d=[d  y(end,16)./(y(end,15)+y(end,16)+y(end,17)+y(end,20))];
end
 plot(cs,d,'--');hold on;
end