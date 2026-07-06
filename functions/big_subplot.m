function ax = big_subplot(Nrow, Ncol, ix, margin)
% Subplot with narrow margin
%
% - Input
%  Nrow : Number of rows
%  Ncol : Number of collumns
%  ix : Index of a figure
%  margin.h: Horizontal margin
%        .h0: First and last horizontal margin
%        .v: Vertical margin
%        .v0: First and last vertical margin
%
% Y. Takeda 2018-12-12
%
% Copyright (C) 2011, ATR All Rights Reserved.
% License : New BSD License(see VBMEG_LICENSE.txt)

if exist('margin', 'var')
    h0 = margin.h0;
    v0 = margin.v0;
    h = margin.h;
    v = margin.v;
else
    h0 = 0.08;
    v0 = 0.08;
    h = 0;
    v = 0;
end

width = (1-h0*2-h*(Ncol-1))/Ncol;% Width of a figure
height = (1-v0*2-v*(Nrow-1))/Nrow;% Height of a figure
ix_row = ceil(ix/Ncol);% Index in row
ix_col = mod(ix-1, Ncol)+1;% Index in collumn

rect = [h0+(width+h)*(ix_col-1), 1-v0-(v+height)*ix_row+v, width, height];
ax = axes('OuterPosition', rect);
