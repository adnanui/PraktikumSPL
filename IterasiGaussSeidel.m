function [x,iter] = IterasiGaussSeidel(A,b,tol,max_iter,tampil)
tic;
[n,m] = size(A);
x = zeros(n,1);                % tebakan awal x0 = 0
C = -A;
for i = 1:n,
    C(i,i) = 0;
    C(i,:) = C(i,:)/A(i,i);
    d(i,1) = b(i)/A(i,i);
end
i = 1;
while (i <= max_iter)
    xlama = x;
    for j = 1:n,
        x(j) = C(j,:)*x + d(j);    % memakai nilai terbaru yang sudah dihitung
    end
    if (tampil), printf('%2d  %10.6f %10.6f %10.6f %10.6f %10.6f\n', i, x); end
    if (abs(xlama - x) <= tol)
        iter = i;
        toc;      % waktu berhenti sebelum proses cetak
        disp('Gauss Seidel method konverge');
        return;
    end
    i = i + 1;
end
iter = max_iter;
toc;      % waktu berhenti sebelum proses cetak
disp('Gauss Seidel method not konverge');
