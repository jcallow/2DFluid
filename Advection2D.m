function [u, v] = Advection2D(delx, delt, I, J, u, v )

%Find our new staggered U values
for i = 2:I
    for j = 1:J
        Xi = i - (1/2)*(delt/delx)*u(i,j);
        Xj = j - (1/2)*(delt/delx)*(1/4)*(v(i,j)+v(i-1,j)+v(i,j+1)+v(i-1,j+1));

        if ((1<=Xi)&&(Xi<I+1)&&(1<=Xj)&&(Xj<J))
            Fi = floor(Xi);
            Ci = Fi+1;
            Fj = floor(Xj);
            Cj = Fj+1;
            
            % find weights for middle velocity
            c = (Fi-Xi)*(Fj-Xj);
            d = (Xi-Fi)*(Cj-Xj);
            a = (Ci-Xi)*(Cj-Xj);
            b = (Ci-Xi)*(Xj-Fj);
            
            u(i,j) = a*u(Fi, Fj) + b*u(Fi, Cj) + c*u(Ci, Cj) + d*u(Ci,Fj);
           
            
        else
            
            %if outside boundary assume 0 for now
            
            u(i,j) = 0;
            
        end

%         % Move back along characteristic line to find new velocity
%         
%         Xp_i = i - (delt/delx)*Um_i;
%         Xp_j = j - (delt/delx)*Um_j;
% 
%         if ((1<=Xp_i)&&(Xp_i<=I)&&(1<=Xp_j)&&(Xp_j<=J))
%             
%             % find and apply weights again.
%             Fi = floor(Xp_i);
%             Ci = ceil(Xp_i);
%             Rj = round(Xp_j);
%             
%             a = Xp_i - Fi;
%             
%             Uout(i,j) = a*U(Fi, Rj) + (1-a)*(U(Ci, Rj));
%         else
%             Uout(i,j) = 0;
%         end
    end
end

for j = 1:J
    Xi = 1 - (1/2)*(delt/delx)*u(1,j);
    Xj = j - (1/2)*(delt/delx)*(1/4)*(v(1,j)+v(1,j+1));
    
    if ((1<=Xi)&&(Xi<I+1)&&(1<=Xj)&&(Xj<J))
            Fi = floor(Xi);
            Ci = Fi+1;
            Fj = floor(Xj);
            Cj = Fj+1;
            
            % find weights for middle velocity
            c = (Fi-Xi)*(Fj-Xj);
            d = (Xi-Fi)*(Cj-Xj);
            a = (Ci-Xi)*(Cj-Xj);
            b = (Ci-Xi)*(Xj-Fj);
            
            u(1,j) = a*u(Fi, Fj) + b*u(Fi, Cj) + c*u(Ci, Cj) + d*u(Ci,Fj);
           
            
        else
            
            %if outside boundary assume 0 for now
            
            u(1,j) = 0;
            
    end
end


for j = 1:J
    Xi = I+1 - (1/2)*(delt/delx)*u(I+1,j);
    Xj = j - (1/2)*(delt/delx)*(1/4)*(v(I,j)+v(I,j+1));
    
    if ((1<=Xi)&&(Xi<I+1)&&(1<=Xj)&&(Xj<J))
            Fi = floor(Xi);
            Ci = Fi+1;
            Fj = floor(Xj);
            Cj = Fj+1;
            
            % find weights for middle velocity
            c = (Fi-Xi)*(Fj-Xj);
            d = (Xi-Fi)*(Cj-Xj);
            a = (Ci-Xi)*(Cj-Xj);
            b = (Ci-Xi)*(Xj-Fj);
            
            u(I+1,j) = a*u(Fi, Fj) + b*u(Fi, Cj) + c*u(Ci, Cj) + d*u(Ci,Fj);
           
            
        else
            
            %if outside boundary assume 0 for now
            
            u(I+1,j) = 0;
            
    end
end


for i = 1:I
    for j = 2:J
        Xi = i - (1/2)*(delt/delx)*(1/4)*(u(i,j)+u(i+1,j)+u(i, j-1)+u(i+1,j-1));
        Xj = j - (1/2)*(delt/delx)*v(i,j);

        if ((1<=Xi)&&(Xi<I)&&(1<=Xj)&&(Xj<J+1))
            Fi = floor(Xi);
            Ci = Fi+1;
            Fj = floor(Xj);
            Cj = Fj+1;
            
            % find weights for middle velocity
            c = (Fi-Xi)*(Fj-Xj);
            d = (Xi-Fi)*(Cj-Xj);
            a = (Ci-Xi)*(Cj-Xj);
            b = (Ci-Xi)*(Xj-Fj);
            
            v(i,j) = a*v(Fi, Fj) + b*v(Fi, Cj) + c*v(Ci, Cj) + d*v(Ci,Fj);
           
            
        else
            
            %if outside boundary assume 0 for now
            
            u(i,j) = 0;
            
        end

%         % Move back along characteristic line to find new velocity
%         
%         Xp_i = i - (delt/delx)*Um_i;
%         Xp_j = j - (delt/delx)*Um_j;
% 
%         if ((1<=Xp_i)&&(Xp_i<=I)&&(1<=Xp_j)&&(Xp_j<=J))
%             
%             % find and apply weights again.
%             Fi = floor(Xp_i);
%             Ci = ceil(Xp_i);
%             Rj = round(Xp_j);
%             
%             a = Xp_i - Fi;
%             
%             Uout(i,j) = a*U(Fi, Rj) + (1-a)*(U(Ci, Rj));
%         else
%             Uout(i,j) = 0;
%         end
    end
end

for i = 1:I
    Xi = i - (1/2)*(delt/delx)*(1/4)*(u(i,1)+u(i+1,1));
    Xj = 1 - (1/2)*(delt/delx)*v(i,1);
    
    if ((1<=Xi)&&(Xi<I)&&(1<=Xj)&&(Xj<J+1))
            Fi = floor(Xi);
            Ci = Fi+1;
            Fj = floor(Xj);
            Cj = Fj+1;
            
            % find weights for middle velocity
            c = (Fi-Xi)*(Fj-Xj);
            d = (Xi-Fi)*(Cj-Xj);
            a = (Ci-Xi)*(Cj-Xj);
            b = (Ci-Xi)*(Xj-Fj);
            
            v(i,1) = a*v(Fi, Fj) + b*v(Fi, Cj) + c*v(Ci, Cj) + d*v(Ci,Fj);
           
            
        else
            
            %if outside boundary assume 0 for now
            
            v(i,1) = 0;
            
    end
end

for i = 1:I
    Xi = i - (1/2)*(delt/delx)*(1/4)*(u(i,J)+u(i+1,J));
    Xj = J+1 - (1/2)*(delt/delx)*v(i,J+1);
    
    if ((1<=Xi)&&(Xi<I)&&(1<=Xj)&&(Xj<J+1))
            Fi = floor(Xi);
            Ci = Fi+1;
            Fj = floor(Xj);
            Cj = Fj+1;
            
            % find weights for middle velocity
            c = (Fi-Xi)*(Fj-Xj);
            d = (Xi-Fi)*(Cj-Xj);
            a = (Ci-Xi)*(Cj-Xj);
            b = (Ci-Xi)*(Xj-Fj);
            
            v(i,J+1) = a*v(Fi, Fj) + b*v(Fi, Cj) + c*v(Ci, Cj) + d*v(Ci,Fj);
           
            
        else
            
            %if outside boundary assume 0 for now
            
            v(i,J+1) = 0;
            
    end
end
end

