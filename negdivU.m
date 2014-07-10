function divUout = negdivU( I, J, delx, u, v, medium )
divUout = zeros(I, J);

for i = 1:I
    for j = 1:J
        if medium(i,j) == 1
        divUout(i,j) = (-1/delx)*((u(i+1,j) - u(i,j)) + (v(i, j+1)-v(i,j)));
        end
    end
end

end

