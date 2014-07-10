function [U,V] = pressure_update(delx, delt, rho, I, J, u, v, us, vs, Medium, p)

scale  = delt/(rho*delx);

for i=2:I-1
    for j = 1:J
        if Medium(i,j)==1
            
            u(i,j) = u(i,j)-scale*p(i,j);
            u(i+1,j) = u(i+1,j)+scale*p(i,j);
            
        elseif Medium(i,j)==2
            u(i,j) = us(i,j);
            u(i+1,j) = us(i+1,j);
        end
    end
end

u(1,:) = us(1,:);
u(I+1,:) = us(I+1,:);

for i=1:I
    for j = 2:J-1
        if Medium(i,j)==1
            
            v(i,j) = v(i,j)-scale*p(i,j);
            v(i,j+1) = v(i,j+1)+scale*p(i,j);
            
        elseif Medium(i,j)==2
                
            v(i,j) = vs(i,j);
            v(i,j+1) = vs(i,j+1);

        end
    end
end

v(:,1) = vs(:,1);
v(:,J+1) = vs(:,J+1);


U = u;
V = v;
end