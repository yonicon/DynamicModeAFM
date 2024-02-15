%% Simulation of Lennard-Jones potential and resulting force values
% 
function [Potential,Force] = SampleDistanceLJ(distance)
% returns [Joules,N] 
JoulePerEv=1.60218e-19;
welldepth=5*JoulePerEv;
zeropotentialdistance=0.5e-9; %0.5nm
minimumpotentialdistance=zeropotentialdistance*2^(1/6);
Potential=4*welldepth*((zeropotentialdistance/distance)^12-(zeropotentialdistance/distance)^6);
Force=48*welldepth*(((zeropotentialdistance^12)/(distance^13))-(0.5*(zeropotentialdistance^6)/(distance^7)));
