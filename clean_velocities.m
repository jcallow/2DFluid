function [u,v] = clean_velocities(I,J, Medium, u, v)

for i = 1:I
    for j = 1:J
        if (i<I)&&(Medium(i,j) == 0)&&(Medium(i+1,j)==0)
            u(i+1,j) = 0;
        end
        
        if (j<J)&&(Medium(i,j) == 0)&&(Medium(i,j+1)==0)
            v(i,j+1) = 0;
        end
    end
end


        