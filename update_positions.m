% Move particles

function [newX, newY] = update_positions(delx, delt, I, J, Xpos, Ypos, UC, VC)

newX = zeros(size(Xpos));
newY = zeros(size(Ypos));
scale = delt/delx;

for i = 1:size(Xpos,2)
    x1 = round(Xpos(i));
    x2 = round(Ypos(i));
    if (((x1 >= 1)&&(x1 <= I))&&((x2 >= 1)&&(x2 <= J)))
        newX(i) = Xpos(i) + scale*UC(x1,x2);
        newY(i) = Ypos(i) + scale*VC(x1,x2);
    end
end