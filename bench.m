A = [ 5 -1 -1  0  0; -1  5 -1 -1  0; -1 -1  4 -1 -1; 0  0  1  4 -2; 0  1 -1  1  4];
b = [-1; 2; 6; 2; -1]; tol = 0.001; max_iter = 20;
N = 500;
names = {'Gauss','Gauss-Jordan','Dekomposisi LU','Jacobi','Gauss-Seidel'};
T = zeros(N,5);
for r = 1:N
  s = evalc('Gauss(A,b);');                    T(r,1) = sscanf(s,'Elapsed time is %f');
  s = evalc('GaussJordan(A,b);');              T(r,2) = sscanf(s,'Elapsed time is %f');
  s = evalc('DekomposisiLU(A,b);');            T(r,3) = sscanf(s,'Elapsed time is %f');
  s = evalc('Jacobi(A,b,tol,max_iter,false);'); T(r,4) = sscanf(s(strfind(s,'Elapsed'):end),'Elapsed time is %f');
  s = evalc('IterasiGaussSeidel(A,b,tol,max_iter,false);'); T(r,5) = sscanf(s(strfind(s,'Elapsed'):end),'Elapsed time is %f');
end
T = T(21:end,:);   % buang 20 run pertama (pemanasan)
printf('%-16s %12s %12s %12s\n','Metode','rata2 (ms)','median (ms)','min (ms)');
for k=1:5, printf('%-16s %12.4f %12.4f %12.4f\n',names{k},1e3*mean(T(:,k)),1e3*median(T(:,k)),1e3*min(T(:,k))); end
