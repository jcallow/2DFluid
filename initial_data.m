function [u, v] = initial_data(I, J, delx)

x = 0:I;
y = 0:J;

u = zeros(I+1, J);
v = zeros(I, J+1);

for i = 1:I+1
    for j = 1:J
        u(i,j) = 0;
    end
end

for i = 1:I
    for j = 1:J+1
        v(i,j) = 1;
    end
end
