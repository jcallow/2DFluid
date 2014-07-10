function RHS = RHS_solid(dx,I,J,u,v,us,vs,rhs,Medium)

scale = 1/dx;


for i=1:I
    for j=1:J
        if Medium(i,j)==1
            if (i>1)&&(Medium(i-1,j) == 2)
                rhs(i,j) = rhs(i,j) - scale*(u(i,j)-us(i,j));
                
            elseif (i == 1)
                rhs(i,j) = rhs(i,j) - scale*(u(i,j)-us(i,j));
                
            end
            if (i<I)&&(Medium(i+1,j)==2)
               rhs(i,j) = rhs(i,j) + scale*(u(i+1,j)-us(i+1,j));   
               
            end
            
            if (j>1)&&(Medium(i,j-1) == 2)
                rhs(i,j) = rhs(i,j) - scale*(v(i,j)-vs(i,j));
                
            elseif (j==1)
                rhs(i,j) = rhs(i,j) - scale*(v(i,j)-vs(i,j));
                
            end
            if (j<J)&&(Medium(i,j+1)==2)
                rhs(i,j) = rhs(i,j) + scale*(v(i,j+1)-vs(i,j+1));
                
            end
        end
    end
end

RHS = rhs;

end

