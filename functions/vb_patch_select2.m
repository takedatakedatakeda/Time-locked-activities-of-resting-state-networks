function Fnew = vb_patch_select2(Vix,F,Nvertex)
% select patch which include given vertex points
%   Fnew = vb_patch_select(Vix,F,Nvertex)
%
% Copyright (C) 2011, ATR All Rights Reserved.
% License : New BSD License(see VBMEG_LICENSE.txt)

Itrans = zeros(Nvertex,1);
Itrans(Vix) = 1:length(Vix);
Fnew = Itrans(F);
ix = find(sum(Fnew,2));
Fnew = F(ix,:);
