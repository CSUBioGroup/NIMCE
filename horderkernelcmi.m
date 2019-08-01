function [ I ] = horderkernelcmi( y,x0,x1,y0,y1, h, ind )
% Kernel-based estimate for multi time delays Transfer Entropy I(X0, X1,Y|Y0,Y1)
% h - kernel width; ind - subset of data on which to estimate MI
% 
[Nx0, Mx0]=size(x0);
[Ny, My]=size(y);
[Ny0, My0]=size(y0);
[Ny1, My1]=size(y1);
[Nx1, Mx1]=size(x1);

if any([Nx0 Ny Ny0 My My0] ~= [1 1 Ny0 Mx0 Mx0])
    error('Bad sizes of arguments');
end

if nargin < 6
    % Yields unbiased estiamte when Mx->inf 
    % and low MSE for two joint gaussian variables
    alpha = 0.25;
    h = (My + 1) / sqrt(12) / My ^ (1 + alpha);
end

if nargin < 7
    ind = 1:My;
end

% Copula-transform variables

x0=coupla_transform(x0);
x1=coupla_transform(x1);
y = coupla_transform(y);
y0 = coupla_transform(y0);
y1 = coupla_transform(y1);

h2 = 2*h^2;

% Pointwise values for kernels

Kx0 = squareform(exp(-ssqd([x0;x0])/h2))+eye(Mx0);
Kx1= squareform(exp(-ssqd([x1;x1])/h2))+eye(Mx1);
Ky = squareform(exp(-ssqd([y;y])/h2))+eye(My);
Ky0 = squareform(exp(-ssqd([y0;y0])/h2))+eye(My0);
Ky1 = squareform(exp(-ssqd([y1;y1])/h2))+eye(My1);

% Kernel sums for marginal probabilities

Kx0x1 = Kx0.*Kx1;
Cx0x1 = sum(Kx0x1);
Cy = sum(Ky);


% Kernel products for joint probabilities
Ky0y1 = Ky0.*Ky1;
Kyy0y1 = Ky.*Ky0.*Ky1;
Kx0x1y0y1=Kx0x1.*Ky0.*Ky1;
Kyx0x1y0y1=Ky.*Kx0x1.*Ky0.*Ky1;

f = ((Cy.*Cx0x1)*Ky0y1).*sum(Kyx0x1y0y1)./(Cx0x1*Kyy0y1)./(Cy*Kx0x1y0y1);
I = mean(log(f(ind)));


end