function x = GaussJordan(A,b)
tic;
n = length(b);
Ab = [A b];
for k = 1:n
    Ab(k,:) = Ab(k,:)/Ab(k,k);
    for i = 1:n
        if (i ~= k)
            Ab(i,:) = Ab(i,:) - Ab(i,k)*Ab(k,:);
        end
    end
end
x = Ab(:,n+1);
toc;
