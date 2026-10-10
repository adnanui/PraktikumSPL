function x = DekomposisiLU(A,b)
tic;
n = length(b);
L = eye(n);
U = A;
% faktorisasi A = L*U (Doolittle)
for k = 1:n-1
    for i = k+1:n
        L(i,k) = U(i,k)/U(k,k);
        U(i,:) = U(i,:) - L(i,k)*U(k,:);
    end
end
% L*y = b (substitusi maju)
y = zeros(n,1);
for i = 1:n
    y(i) = b(i) - L(i,1:i-1)*y(1:i-1);
end
% U*x = y (substitusi mundur)
x = zeros(n,1);
for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n)*x(i+1:n))/U(i,i);
end
toc;
