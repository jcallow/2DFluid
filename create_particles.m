function [Xpos, Ypos] = create_particles(I, J, Medium)

Xpos = [];
Ypos = [];

for i = 1:I
    for j = 1:J
        if (Medium(i,j) == 1)
            Xpos = [Xpos, i-.25, i-.25, i+.25, i+.25];
            Ypos = [Ypos, j-.25, j+.25, j-.25, j+.25];
        end
    end
end