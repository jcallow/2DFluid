function ApplyM = ApplyPreconditioner(I, J, Medium, r, Aplusi, Aplusj, preconditioner)

% Solve Lq = r

q = zeros(I,J);
z = zeros(I,J);

for i = 1:I
    for j = 1:J
        if Medium(i,j) == 1
            if (i>1)&&(j>1)
                t = r(i,j) - Aplusi(i-1,j)*preconditioner(i-1,j)*q(i-1,j)-Aplusj(i,j-1)*preconditioner(i,j-1)*q(i,j-1);
            elseif (i>1)
                t = r(i,j) - Aplusi(i-1,j)*preconditioner(i-1,j)*q(i-1,j);
            elseif (j>1)
                t = r(i,j) - Aplusj(i,j-1)*preconditioner(i,j-1)*q(i,j-1);
            else
                t = r(i,j);
            end
            q(i,j) = t*preconditioner(i,j);
        end
    end
end

% Solve LTz = q

for i = I:-1:1
    for j = J:-1:1
        if Medium(i,j) == 1
            if (i<I)&&(j<J)
                t = q(i,j)-Aplusi(i,j)*preconditioner(i,j)*z(i+1,j)-Aplusj(i,j)*preconditioner(i,j+1)*z(i,j+1);
            elseif (i<I)
                t = q(i,j) - Aplusi(i,j)*preconditioner(i,j)*z(i+1,j);
            elseif (j<J)
                t = q(i,j) - Aplusj(i,j)*preconditioner(i,j)*z(i,j+1);
            else
                t = q(i,j);
            end
            z(i,j) = t*preconditioner(i,j);
        end
    end
end

ApplyM = z;