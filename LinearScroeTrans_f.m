function [Sc] = LinearScroeTrans_f(var,threshL,threshU,xlo,xup)

%var: variable
%threshL, threshU, planetary boundary
%xlo, xup, scores that correspond to threshL and threshU
%yr_period: years that used to get the plinetary boundary



slope = (threshU - threshL)/(xup-xlo);
threshO = threshL - xlo* slope;

Sc = (var - threshO)./slope;
end

