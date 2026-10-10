function x = Gauss(A,b)
tic;
n = length(b);
Ab = [A b];
% eliminasi maju
for k = 1:n-1
    for i = k+1:n
        m = Ab(i,k)/Ab(k,k);
        Ab(i,:) = Ab(i,:) - m*Ab(k,:);
    end
end
% substitusi mundur
x = zeros(n,1);
x(n) = Ab(n,n+1)/Ab(n,n);
for i = n-1:-1:1
    x(i) = (Ab(i,n+1) - Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
end
toc;
