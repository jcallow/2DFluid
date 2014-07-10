function dotprod = DP(a, b)

I = size(a,1);
J = size(a,2);

D = 0;

for i = 1:I
    for j = 1:J
        D = D + a(i,j)*b(i,j);
    end
end
dotprod = D;
end