od30_100_1=[0.05	0.32	0.93	1.82	2.92	4.31	5.45	6.41	7.41  4.16	3.33	3.15	3.04	2.80];
para=[       10.1572    1.95  120.5862    1.6943    0.622   13.2283    3.0000    0.3000 ];
        kc=para(1);
vm=para(2);
Kn=para(3);
h=para(4);kd=para(5);Kd=para(6);m=para(7);fn=para(8);
t0=[0,1,2,3,4,5,6,7,8,12,13,14,15,16];
C0=0.1;

[tts,y]=ode15s(@(t,nc)F(t,nc,para(1:8)),[0,30],[100,C0]');
  plot(tts,y(:,2),'k','Linewidth',2); hold on;
   plot(t0,od30_100_1,'o');
   xlim([0,15]);
n=y(:,1);
 
dc=vm.*(n.^h./(n.^h+Kn.^h));
yyaxis right;
plot(tts,dc,'--','Linewidth',2)
