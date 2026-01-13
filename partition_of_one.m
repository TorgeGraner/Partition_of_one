% Render the manifold defined by the equation cos(x) + sin(y) - z^2 = 1 by scaling points on the unit sphere using Newtons method
% and color it according to a partition of one

g = @(t) f(t) ./ (f(t) + f(1 - t));
a = @(x, y) 1 - g(sqrt(x.^2 + y.^2) - 1);
k = 4;


% Parameter space
[theta, phi] = meshgrid(0:pi/600:pi, 0:pi/400:2*pi);

% Standard parameterization of sphere
X = sin(theta) .* cos(phi);
Y = sin(theta) .* sin(phi);
Z = cos(theta);

X_n = pi/4 * X ./ X;

% Apply a step of Newtons method to the function f(r) = cos(rx) + sin(ry) - (rz)^2 - 1 to approximate a scalar r, such that r*(x,y,z) lies in the manifold
for i = 1:20
    ff = cos(X_n .* X) + cos(X_n .* Y) - (X_n .* Z).^2 - 1;
    fp = X .* sin(X_n .* X) + Y .* sin(X_n .* Y) + 2 * Z.^2 .* X_n;

    X_n = X_n + ff ./ fp;
end

X = X .* X_n;
Y = Y .* X_n;
Z = Z .* X_n;

H_2 = colorMap(X, Y, 3/4, 3/4, a, k) + colorMap(Y, Z, 2/3, 10/9, a, k) + colorMap(X, Z, 2/3, 10/9, a, k);

clf
hold on
    set(gca,'visible','off');
    
    surf(X, Y, -Z, H_2);
    shading interp
    colorbar

    view(3)
    %exportgraphics(gca, 'PartitionOfOne.eps');
hold off

% Color the point on the sphere corresponding to the overlap of a partition of one 
function r = colorMap(X, Y, a_1, a_2, a, k)
    F_x = X * a_1;
    F_y = Y * a_2;
    
    N = sqrt(F_x.^2 + F_y.^2);
    
    N(N > 1) = 1;
    F_x(N > 1) = 1;
    F_y(N > 1) = 0;
    
    G = 3 * (1 - (1 - N).^(1 / k));
    
    F_x = F_x .* G;
    F_y = F_y .* G;

    r = a(F_x, F_y);
end

function y = f(t)
    y = exp(-1 ./ t.^2);
    y(t < 0) = 0;
end