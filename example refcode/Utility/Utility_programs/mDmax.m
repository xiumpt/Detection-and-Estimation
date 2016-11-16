% mDmax.m
%
% This program finds the maximum and location of the maximum of a 
% D-dimensional function, where D can be 2,3, or 4.  It is more convenient
% to use than MATLAB's max function.  It assumes the maximum value is
% greater than -1e10.
%
%  Input parameters:
%    f - array of function values arranged as f(i,j) for D=2 or f(i,j,k)
%        for D=3 or f(i,j,k,l) for D=4
%    D - dimensionality of function to be maximized. D can be 2 or 3 or 4.
%
%  Output parameters:
%    fmax - value of the maximum of f
%    Index - the index of the array at which the maximum is located
%
function [fmax, Index]=mDmax(f,D)
fmax=-1e10;
if D==2
   for i=1:length(f(:,1))
      for j=1:length(f(1,:))
         if f(i,j)>fmax
            I=i;J=j;fmax=f(i,j);
         end
      end
   end
   Index=[I J]';
elseif D==3
   for i=1:length(f(:,1,1))
      for j=1:length(f(1,:,1))
         for k=1:length(f(1,1,:))
         if f(i,j,k)>fmax
            I=i;J=j;K=k;fmax=f(i,j,k);
         end
      end
   end
end
Index=[I J K]';
elseif D==4
   for i=1:length(f(:,1,1,1))
      for j=1:length(f(1,:,1,1))
         for k=1:length(f(1,1,:,1))
             for l=1:length(f(1,1,1,:))
         if f(i,j,k,l)>fmax
            I=i;J=j;K=k;L=l;fmax=f(i,j,k,l);
         end
      end
   end
      end
   end
Index=[I J K L]';
end

