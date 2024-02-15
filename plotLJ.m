Xstart=0.0e-9;
Xend=5e-9;
Xrange=Xend-Xstart;
NumPoint=3000;
Xstep=Xrange/NumPoint;
x=zeros(1,NumPoint);
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
JoulePerEv=1.60218e-19;
EvPerJoule=1/JoulePerEv;
%plot(x,V);
DP_fig=figure;
DP_Plot=plot(x.*1e9,V.*EvPerJoule);

set(DP_fig,'Name','Potential vs Seperation');
xlabel({'Seperation distance','[nm]'});
ylabel({'Potential','[eV]'});
%plot(x,F);
DF_fig=figure;
DF_Plot=plot(x.*1e9,F.*1e9);

set(DF_fig,'Name','Force vs. Seperation');

xlabel({'Seperation distance','[nm]'});
ylabel({'Force','[nN]'});

%plot (x,dF/dx);
DdF_fig=figure;
DdF_Plot=plot(x.*1e9,dF);

set(DdF_fig,'Name','dForce/dx vs. Seperation');
str = 'Seperation Vs. $\frac{dF}{dx}$';

xlabel({'Seperation distance','[nm]'},'Interpreter','latex');
ylabel('$\frac{dF}{dx}$ $[\frac{N}{m}]$','Interpreter','latex');




   