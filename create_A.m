function A = create_A(Adiag, Aplusi, Aplusj, I, J)

size = (I)*(J);
A = zeros(size);
Adiag = reshape(Adiag,1,size);
Aplusi = reshape(Aplusi,1,size);
Aplusj = reshape(Aplusj,1,size);

for i = 1:size
    A(i,i) = Adiag(i);
    
    if (i<size)
        A(i+1,i) = Aplusi(i);
    end
    
    if (i>1)
        A(i-1, i) = Aplusi(i-1);
    end
    
    if (i < size-I)
        A(i+I,i) = Aplusj(i);
    end
    
    if (i > I)
        A(i-I, i) = Aplusj(i-I);
    end
end