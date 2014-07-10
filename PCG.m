function updated_pressure = PCG(I, J, rhs, tol, Medium, Aplusi, Aplusj, Adiag, preconditioner)

p = zeros(I,J);
r = rhs;

if (r==0)
    updated_pressure = p;
    return;
end

z = ApplyPreconditioner(I, J, Medium, r, Aplusi, Aplusj, preconditioner);
s = z;
theta = DP(z,r);

for i = 1:200
    z = ApplyA(I, J, Adiag, Aplusi, Aplusj, s);
    alpha = theta/DP(z,s);
    p = p + alpha*s;
    r = r - alpha*z;
    if (max(abs(r(:))) <= tol);
        updated_pressure = p;
        return;
    end
    z = ApplyPreconditioner(I, J, Medium, r, Aplusi, Aplusj, preconditioner);
    theta_new = DP(z,r);
    Beta = theta_new/theta;
    s = z + Beta*s;
    theta = theta_new;
    if i == 2000
        display('welp');
    end
end
updated_pressure = p;
end