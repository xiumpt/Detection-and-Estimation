% plotlineroutine.m
%
% This program was used to generate the MATLAB plots in the textbook.
% Set xlength = 4, ylength =4 for standard size plot with scale=0.75.  
% For two side by side plots use xlength = 3, ylength =3 and a scale=0.75 
% inside Latex file.
%
% Input parameters:
%
%  x        - data values for x-axis
%  y        - data values for y-axis
%  markeron - set to 'on' to mark each point with a symbol
%  marker   - if each point is to be marked set to 'o' or 'x', etc.
%  xlength  - length of x-axis in inches
%  ylength  - length of y-axis in inches
%  boxon    - set to 'on'
%  gridon   - set to 'on' for grid
%  xlab     - label for x-axis
%  ylab     - label for y-axis
%  mtitle   - title for plot
%
function plotlineroutine(x,y,markeron,marker,xlength,ylength,boxon,gridon,xlab,ylab,mtitle)
figure
axes('position',[0.2,0.2,xlength*(0.375/3),ylength*(0.375/3)],'box',boxon)
if markeron=='on'
   line(x,y,'linewidth',1.5,'marker',marker,'linestyle','none')
else
   line(x,y,'linewidth',1.5)
end
if gridon=='on'
  grid
end
xlabel(xlab)
ylabel(ylab)
title(mtitle)