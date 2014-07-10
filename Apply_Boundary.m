function [u, v] = Apply_Boundary(I, J, Medium, u, v ,us, vs)

for i = 2:I-1
    for j = 1:J
        if (Medium(i+1,j)==2)
            u(i+1,j) = us(i,j);
        end
        
        if (Medium(i-1, j)==2)
            u(i,j) = us(i-1,j);
        end
    end
end

u(I+1,:) = 0;
u(1,:) = 0;

for i = 1:I
    for j = 2:J-1
        if (Medium(i,j+1)==2)
            v(i,j+1) = vs(i,j);
        end
        
        if (Medium(i,j-1)==2)
            v(i,j) = vs(i,j-1);
        end
    end
end

v(:,J+1) = 0;
v(:,1) = 0;

end