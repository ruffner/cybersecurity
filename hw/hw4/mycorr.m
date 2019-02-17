function C = mycorr(x,y)
%faster corrcoef for two matrices (octave style)
%only real numbers(?)
%rows ... observations
%columns ... variables

  [xr,xc] = size(x);
  [yr,yc] = size(y);
  assert((xr==yr), 'Matrix row count mismatch');

  % -> Compute correlation coefficient between x and y <-

  C=corrcoef(x,y);
end
