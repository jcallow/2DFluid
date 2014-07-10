function [u,v] = gravity_update(I,J,delx,delt,u,v)

vel_g = (4.9/delx)*delt^2;

v(:,:) = v(:,:) + vel_g;
end