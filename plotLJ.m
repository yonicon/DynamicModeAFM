%plots Interaction Potential Force and df/dx VS. Seperation distance. 
Xstart=0.0e-9; %minimum distance - meters
Xend=5e-9;     %maximum distance - meters
Xrange=Xend-Xstart;
NumPoint=3000;  %number of points to plot. 
Xstep=Xrange/NumPoint; %step between points
x=zeros(1,NumPoint);  %init arrays
V=zeros(1,NumPoint);
F=zeros(1,NumPoint);
dF=zeros(1,NumPoint);
for i=0:(NumPoint-1)
    x(i+1)=Xstart+(i*Xstep); 
    [V(i+1),F(i+1)]=sampledistanceLJ(x(i+1));

    if i==0                %calculate get dF/dx
         dF(i+1)=nan;
    else
         dF(i+1)=(F(i+1)-F(i))/Xstep;
    end
end
for i=0:(NumPoint-1)
    if i==0                %calculate get dF/dx
    else
         ddF(i+1)=(dF(i+1)-dF(i))/Xstep;
    end
end
JoulePerEv=1.60218e-19;
EvPerJoule=1/JoulePerEv;
%plot(x,V);
DP_fig=figure;
DP_Plot=plot(x.*1e9,V.*EvPerJoule);
set(get(gca,'Xaxis'),'Limits',[0 1.5]);
set(get(gca,'Yaxis'),'Limits',[-10 10]);
set(DP_fig,'Name','Potential vs Seperation');
xlabel({'Seperation distance','[nm]'},'Interpreter','latex');
ylabel({'Potential','[eV]'},'Interpreter','latex');
%plot(x,F);
DF_fig=figure;
DF_Plot=plot(x.*1e9,F.*1e9);
set(get(gca,'Xaxis'),'Limits',[0 1.5]);
set(get(gca,'Yaxis'),'Limits',[-10 10]);
set(DF_fig,'Name','Force vs. Seperation');

xlabel({'Seperation distance','[nm]'},'Interpreter','latex');
ylabel({'Force','[nN]'},'Interpreter','latex');

%plot (x,dF/dx);
dF_fig=figure;
dF_Plot=plot(x.*1e9,dF);

set(dF_fig,'Name','dForce/dx vs. Seperation');
str = 'Seperation Vs. $\frac{dF}{dx}$';
set(get(gca,'Xaxis'),'Limits',[0 1.5])
set(get(gca,'Yaxis'),'Limits',[-100 25])
xlabel({'Seperation distance','[nm]'},'Interpreter','latex');
ylabel('$\frac{dF}{dx}$ $[\frac{N}{m}]$','Interpreter','latex');

%Plot(x,d^2f/dx^2)
DDF_fig=figure;
DDF_Plot=plot(x.*1e9,ddF);

set(DDF_fig,'Name','ddForce/dxdx vs. Seperation');
str = 'Seperation Vs. $\frac{dF}{dx}$';
set(get(gca,'Xaxis'),'Limits',[0 1.5])
set(get(gca,'Yaxis'),'Limits',[-0.2e12 0.4e12])
xlabel({'Seperation distance','[nm]'},'Interpreter','latex');
ylabel('$\frac{dF}{dx}$ $[\frac{N}{m}]$','Interpreter','latex');




   