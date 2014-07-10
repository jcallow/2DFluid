function preconditioner = precond(I,J, tuning_constant, safety_constant, Adiag, Aplusi, Aplusj, Medium, precon)

E = zeros(I,J);

for i = 1:I
    for j = 1:J
        if Medium(i,j) == 1
            if (i>1)&&(j>1)
                E = Adiag(i,j) - (Aplusi(i-1, j)*precon(i-1,j))^2 - (Aplusi(i, j-1)*precon(i,j-1))^2 - tuning_constant*(Aplusi(i-1,j)*Aplusj(i-1,j)*precon(i-1,j)^2 + Aplusj(i,j-1)*Aplusi(i,j-1)*precon(i,j-1)^2);
            elseif (i>1)
                E = Adiag(i,j) - (Aplusi(i-1, j)*precon(i-1,j))^2 - tuning_constant*(Aplusi(i-1,j)*Aplusj(i-1,j)*precon(i-1,j)^2);
            elseif (j>1)
                E = Adiag(i,j) - (Aplusi(i, j-1)*precon(i,j-1))^2 - tuning_constant*(Aplusj(i,j-1)*Aplusi(i,j-1)*precon(i,j-1)^2);
            end
            if E < safety_constant*Adiag(i,j)
                E = Adiag(i,j);
            end
            precon(i,j) = 1/sqrt(E);
        end
    end
end

preconditioner = precon;
            