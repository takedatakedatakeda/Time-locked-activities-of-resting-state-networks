function Vshrink = vb_shrink_cortex_for_plot(V, F, inflate)
% MATLAB 2014b and later, patch plot order is strange.
% Slightly shrink cortex so that area/act is plotted to top of cortex.

if ~exist('inflate', 'var') || isempty(inflate)
    inflate = false;
end

if vb_matlab_version('>=', '8.4')
    % MATLAB 2014b, patch order is strange
    % so slightly shrink cortex.

    n = struct;
    n.faces = F;
    n.vertices = V;

    Vnorm = patchnormals(n);

    for k=1:size(Vnorm, 1)
        Vnorm(k, :) = Vnorm(k, :) ./ norm(Vnorm(k, :));
    end

    % Shrink standard brain model operation for display
    if inflate
        % inflated cortex
        Vshrink = V + 1*Vnorm;
    else
        % cortex
        Vshrink = V + 0.001*Vnorm;
    end
else
    Vshrink = V;
end


function N = patchnormals(FV)
%Vertex normals of a triangulated mesh, area weighted, left-hand-rule
% N = patchnormals(FV) -struct with fields, faces Nx3 and vertices Mx3
%N: vertex normals as Mx3

%face corners index
A = FV.faces(:,1);
B = FV.faces(:,2);
C = FV.faces(:,3);

%face normals
n = cross(FV.vertices(A,:)-FV.vertices(B,:),FV.vertices(C,:)-FV.vertices(A,:)); %area weighted

%vertice normals
N = zeros(size(FV.vertices)); %init vertix normals
for i = 1:size(FV.faces,1) %step through faces (a vertex can be reference any number of times)
N(A(i),:) = N(A(i),:)+n(i,:); %sum face normals
N(B(i),:) = N(B(i),:)+n(i,:);
N(C(i),:) = N(C(i),:)+n(i,:);
end
