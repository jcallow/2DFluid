function As = ApplyA(I, J, Adiag, Aplusi, Aplusj, s)

output = zeros(I,J);

for i = 2:I-1
    for j = 2:J-1
        output(i,j) = Adiag(i,j)*s(i,j)+Aplusi(i,j)*s(i+1,j)+Aplusi(i-1,j)*s(i-1,j)+Aplusj(i,j)*s(i,j+1)+Aplusj(i,j-1)*s(i,j-1);
    end
end

for i = 2:I-1
    output(i,1) = Adiag(i,1)*s(i,1)+Aplusi(i,1)*s(i+1,1)+Aplusi(i-1,1)*s(i-1,1)+Aplusj(i,1)*s(i,2);
    output(i,J) = Adiag(i,J)*s(i,J)+Aplusi(i,J)*s(i+1,J)+Aplusi(i-1,J)*s(i-1,J)+Aplusj(i,J-1)*s(i,J-1);
end

for j = 2:J-1
    output(1,j) = Adiag(1,j)*s(1,j)+Aplusi(1,j)*s(2,j)+Aplusj(1,j)*s(1,j+1)+Aplusj(1,j-1)*s(1,j-1);
    output(I,j) = Adiag(I,j)*s(I,j)+Aplusi(I-1,j)*s(I-1,j)+Aplusj(I,j)*s(I,j+1)+Aplusj(I,j-1)*s(I,j-1);
end

output(1,1) = Adiag(1,1)*s(1,1)+Aplusi(1,1)*s(2,1)+Aplusj(1,1)*s(1,2);
output(1,J) = Adiag(1,J)*s(1,J)+Aplusi(1,J)*s(2,J)+Aplusj(1,J-1)*s(1,J-1);
output(I,1) = Adiag(I,1)*s(I,1)+Aplusi(I-1,1)*s(I-1,1)+Aplusj(I,1)*s(I,2);
output(I,J) = Adiag(I,J)*s(I,J)+Aplusi(I-1,J)*s(I-1,J)+Aplusj(I,J-1)*s(I,J-1);

As = output;