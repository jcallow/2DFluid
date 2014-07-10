function [Adiag, Aplusi, Aplusj] = Matrix_Form(delt, delx, rho, I, J, Medium)

%{ 
Note that there is an issue at the right edge of the grid.  Don't know
 whether I want to treat outside of the grid is solid, water, or vacuum.
 Right now it is being treated as solid 
%}

scale = delt/(rho*delx*delx);

Adiag = zeros(I,J);
Aplusi = zeros(I,J);
Aplusj = zeros(I,J);

for i = 1:I
    for j = 1:J
        if (i<I)
            if ((Medium(i,j) == 1)&&(Medium(i+1,j)==1))
                Adiag(i,j) = Adiag(i,j) + scale;
                Adiag(i+1,j) = Adiag(i+1,j) + scale;
                Aplusi(i,j) = -scale;
            elseif ((Medium(i,j) == 1)&&(Medium(i+1,j)==0))
                Adiag(i,j) = Adiag(i,j) + scale;
            elseif ((Medium(i,j) == 0)&&(Medium(i+1,j)==1))
                Adiag(i+1,j) = Adiag(i+1,j) + scale;
            end
        end
        
        if (j<J)
            if ((Medium(i,j) == 1)&&(Medium(i,j+1)==1))
                Adiag(i,j) = Adiag(i,j) + scale;
                Adiag(i,j+1) = Adiag(i,j+1) + scale;
                Aplusj(i,j) = -scale;
            elseif ((Medium(i,j) == 1)&&(Medium(i,j+1)==0))
                Adiag(i,j) = Adiag(i,j) + scale;
            elseif ((Medium(i,j) == 0)&&(Medium(i,j+1)==1))
                Adiag(i,j+1) = Adiag(i,j+1) + scale;
            end
        end
    end
end




        