% Negative Divergence that becomes RHS of linear system for pressure solve.

function rhs = RHS( I, J, delx, u, v, Medium)
rhs = zeros(I, J);
scale = 1/delx;

for i = 1:I
    for j = 1:J
        if Medium(i,j) == 1    
            rhs(i,j) = -scale*(u(i+1,j)-u(i,j)+v(i,j+1)-v(i,j));
    
        end
        
    end

end

end

