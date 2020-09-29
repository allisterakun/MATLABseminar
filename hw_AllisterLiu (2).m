% Allister Liu
% Matlab section C
% February 26th? 2020

clear all; close all; clc;

%% d)

% more elements than vectors
v = [1 2 3 4];
complexOrthoSet1 = gramSchmidt(randCompMatrix(4, 3));
isComplexOrtho1 = isOrthonormal(complexOrthoSet1);
complexProj1 = orthoProj(v, complexOrthoSet1);

% same elements and vectors
u = [1 2 3];
complexOrthoSet2 = gramSchmidt(randCompMatrix(3, 3));
isComplexOrtho2 = isOrthonormal(complexOrthoSet2);
complexProj2 = orthoProj(u, complexOrthoSet2);


%% e)

x = linspace(0, 2*pi, 100);
y = sin(x);
u = [0, pi/2, pi, 3*pi/2, 2*pi];
z = [1, 5];
for m = 1:5
    for n = 1:100
        z(n, m) = (1/sqrt(2*pi))*exp(-(x(1,n)-u(m)).^(2));
    end
end
figure;
plot(x, z);
hold on
plot(x, y);
xticks(0: pi/4: 2*pi);
xticklabels({'0','\pi/4','\pi/4','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/8','2\pi'});
title('Sinusoid and Gaussians vs X')


gr = gramSchmidt(z);
pr = orthoProj(y, gr);
pr = pr.';
%pr = orthoProj(y, gramSchmidt(z));

figure

subplot(2,1,1)
plot(x,y)
xticks(0: pi/4: 2*pi);
xticklabels({'0','\pi/4','\pi/4','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/8','2\pi'});
title('sinusoid')

subplot(2,1,2)
plot(x,pr)
xticks(0: pi/4: 2*pi);
xticklabels({'0','\pi/4','\pi/4','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/8','2\pi'});
title('estimated')


%% a)
function [Q] = gramSchmidt(X)
    [a, b] = size(X);
    Q = zeros(a, b);
    R = zeros(b, b);
    for j = 1:b
        v = X(:, j);
        for i = 1:(j-1)
            R(i, j) = Q(:, i)'* X(:, j);
            v = v - R(i, j) * Q(:, i);
        end
        R(j, j) = norm(v);
        Q(:, j) = v / R(j, j);
    end
end

 
%% b)
function [output] = isOrthonormal(X)
    op = 1;
    [m, n] = size(X);
    Y = X.';
    for i = 1:n
        u = [1, m];
        for a = 1:m
            u(a) = Y(i, a);
        end
        if ~isNormal(u)
            output = false;
            op = -1;
        else
            for j = i+1:n
                v = [1, m];
                for a = 1:m
                    v(a) = Y(j, a);
                end
                if ~isOrthogonal(u, v)
                    output = false;
                    op = -1;
                else
                    output = true;
                    
                end
            end
        end
    end
    if op == -1
        output = false;
    elseif op == 1
        output = true;
    end
end

function [output] = isNormal(a)
    if abs(norm(a) - 1) <=1000*eps
        output = true;
    else
        output = false;
    end
end

function [output] = isOrthogonal(a, b)
    if abs(dot(a, b) - 0) <= 1000*eps
        output = true;
    else
        output = false;
    end
end


%% c)
function output = orthoProj(v,X)

    newV = v.';
    output = zeros(size(X,1),1);
    
    for i = 1:size(X,2)
        output = output + proj(newV,X(:,i));
    end
end

%ehhhhh 
function [o] = ortProj(v, X)
    Y = X.';
    [m, n] = size(X);
    O = [n, m];
    
    for i = 1:n
        u = [1, m];
        for j = 1:m
            u(1, j) = Y(i, j);
        end
        w = proj(v, u);
        for k = 1:m
            O(i, k) = w(1, k);
        end
    end
    o = sum(O); 
end

function [O] = proj(u,v)            %projecting u onto v
    u2 = u.';
    v2 = conj(v);
    O = (u2 * v2) / (norm(v))^2 .* v;
end

function randCompM = randCompMatrix(m, n)
   randCompM = [m, n];
   for i=  1:m
       for j = 1:n
           randCompM(i, j) = rand + 1i * rand;
       end
   end
end
