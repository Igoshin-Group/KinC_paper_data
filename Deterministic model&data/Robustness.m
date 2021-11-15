parameters=["va","vc","k1","k2","k3","k4","k5","k6","kc5","kc6","gr","p0e","vb","vf","ke","kube","kb"];
initials=[6,6,200,800,200,800,500,200,700,10,0.5,0.2,2,2,10,200,500];
change=0.3;
sensitivity=[];
n=config('Spo0A_sensitivity.txt');
count=0;

failed=[];

hahc=[];
lalc=[];
halc=[];
lahc=[];

for m=1:1000
    m
    low=0.33;   
    high=3;
    values=initials;
     for i = 3:(length(values))
        values(i)=values(i)*(low)+values(i)*(high-low)*rand(); 
    end
    values(1)=0.01;
    values(2)=0.01;
    xi=zeros(1,n);
    [t,y]=ode15s(@(t,x)Spo0A_full(t,x,parameters,values),[0,20],xi);
    v_low_a_low_c=  y(end,11)./(y(end,10)+y(end,11)+y(end,12)+y(end,15));
    lalc=[lalc v_low_a_low_c];
    
    
    values(1)=0.01;
    values(2)=10;
     xi=zeros(1,n);
    [t,y]=ode15s(@(t,x)Spo0A_full(t,x,parameters,values),[0,20],xi);
    v_low_a_high_c=  y(end,11)./(y(end,10)+y(end,11)+y(end,12)+y(end,15));
    lahc=[lahc v_low_a_high_c];
    
    values(1)=3;
    values(2)=0.01;
    xi=zeros(1,n);
    [t,y]=ode15s(@(t,x)Spo0A_full(t,x,parameters,values),[0,20],xi);
    v_high_a_low_c=  y(end,11)./(y(end,10)+y(end,11)+y(end,12)+y(end,15));
    halc=[halc v_high_a_low_c];
   
    values(1)=3;
    values(2)=10;
    xi=zeros(1,n);
    [t,y]=ode15s(@(t,x)Spo0A_full(t,x,parameters,values),[0,20],xi);
    v_high_a_high_c=  y(end,11)./(y(end,10)+y(end,11)+y(end,12)+y(end,15));
    hahc=[hahc v_high_a_high_c];
    
    
end
save('rob.mat','hahc','halc','lahc','lalc');
%%
load("rob.mat")
figure;
plot(hahc./halc,lalc./lahc,'ko'); hold on;
plot([0.4557/0.5922],[0.0204/0.1832],'ro','MarkerFaceColor','red');hold on;
plot([1,1],[0.7,0],'r--');
xlabel('low-kinA-low-kinC');
ylabel('low-kinA-high-kinC');
%%
p=hahc./halc;
length(p(p>1))