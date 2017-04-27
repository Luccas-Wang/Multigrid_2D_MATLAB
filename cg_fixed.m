% Solve Ax=b
function [xk, conv] = cg_fixed(A,b, cg_steps, initial_guess)
tolerance = 10.0e-7;

xk1=initial_guess;
M = diag(A); % Pre-conditioner
%M = diag(eye(size(A)));
r0=b;
rk1=r0;

iter = 0;

pk = 1;
alpha = 1000;
%while(norm(rk1) > tolerance || iter==0 )
while(norm(alpha*pk) > tolerance || iter==0 )
    zk1 = rk1./M;
    iter = iter + 1;
    if(iter == 1)
        pk = zk1;
    else
        beta = rk1'*zk1/(rk2'*zk2);
        pk = zk1 + beta*pk1;
    end
    Apk = A*pk;
    alpha = rk1'*zk1/(pk'*Apk);
    xk = xk1 + alpha*pk;
    rk = rk1 - alpha*Apk;
    rk2 = rk1;
    rk1=rk;
    pk1 = pk;
    zk2=zk1;
    xk1=xk;
    
    if (iter == cg_steps)
        conv = 0;
        return
    end
end
conv = 1;

end
