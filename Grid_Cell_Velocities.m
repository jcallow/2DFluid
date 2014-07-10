function [UC, VC] = Grid_Cell_Velocities(I, J, u, v)

UC = zeros(I,J);
VC = zeros(I,J);

for i = 1:I
    for j = 1:J
        UC(i,j) = (u(i,j)+u(i+1,j))/2;
        VC(i,j) = (v(i,j)+v(i,j+1))/2;
    end
end