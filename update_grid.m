function NewMedium = update_grid(Xpos, Ypos, I, J, Medium);

tempMedium = zeros(I,J);

for i = 1:I
    for j = 1:J
        if (Medium(i,j) == 2)
            tempMedium(i,j) = 2;
        end
    end
end

for i = 1:size(Xpos,2)
    x1 = round(Xpos(i));
    x2 = round(Ypos(i));
    if (((x1 >= 1)&&(x1 <= I))&&((x2 >= 1)&&(x2 <= J)))
        if (Medium(x1,x2) ~= 2)
            tempMedium(x1,x2) = 1;
        end
    end
end

NewMedium = tempMedium;
