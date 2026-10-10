function [x,iter] = Jacobi(A,b,tol,max_iter,tampil)
tic;
[n,m] = size(A);
xlama = zeros(n,1);            % tebakan awal x0 = 0
C = -A;
for i = 1:n,
    C(i,i) = 0.0;
    C(i,:) = C(i,:)/A(i,i);
    d(i,1) = b(i)/A(i,i);
end
i = 1;
while (i <= max_iter)
    xbaru = C*xlama + d;       % semua komponen memakai nilai iterasi sebelumnya
    if (tampil), printf('%2d  %10.6f %10.6f %10.6f %10.6f %10.6f\n', i, xbaru); end
    if (abs(xbaru - xlama) <= tol)
        x = xbaru; iter = i;
        toc;      % waktu berhenti sebelum proses cetak
        disp('Jacobi method konverge');
        return;
    else
        xlama = xbaru;
    end
    i = i + 1;
end
x = xlama; iter = max_iter;
toc;      % waktu berhenti sebelum proses cetak
disp('Jacobi method not konverge');
