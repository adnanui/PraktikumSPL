% Praktikum SPL - Soal 1, 2, 3
clc; clear;
A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];
b = [-1; 2; 6; 2; -1];
tol = 0.001; max_iter = 20;
eksak = [55/169; 422/507; 70/39; 7/169; -10/507];   % hasil analitik (pecahan eksak)
nama = 'pqrst';
printf('#### GAUSS\n');
xg = Gauss(A,b);
for k=1:5, printf('%c = %.10f\n', nama(k), xg(k)); end
printf('#### GAUSSJORDAN\n');
xgj = GaussJordan(A,b);
for k=1:5, printf('%c = %.10f\n', nama(k), xgj(k)); end
printf('#### LU\n');
xlu = DekomposisiLU(A,b);
for k=1:5, printf('%c = %.10f\n', nama(k), xlu(k)); end
printf('#### JACOBI\n');
printf('iter         p          q          r          s          t\n');
[xj,nj] = Jacobi(A,b,tol,max_iter,true);
printf('jumlah iterasi = %d\n', nj);
for k=1:5, printf('%c = %.10f\n', nama(k), xj(k)); end
printf('#### GAUSSSEIDEL\n');
printf('iter         p          q          r          s          t\n');
[xgs,ngs] = IterasiGaussSeidel(A,b,tol,max_iter,true);
printf('jumlah iterasi = %d\n', ngs);
for k=1:5, printf('%c = %.10f\n', nama(k), xgs(k)); end
printf('#### GALAT\n');
M = {'Gauss',xg;'Gauss-Jordan',xgj;'Dekomposisi LU',xlu;'Jacobi',xj;'Gauss-Seidel',xgs};
printf('%-15s %12s %12s %12s %12s %12s\n','Metode','|dp|','|dq|','|dr|','|ds|','|dt|');
for k = 1:5
    printf('%-15s', M{k,1}); printf(' %12.4e', abs(eksak - M{k,2})); printf('\n');
end
