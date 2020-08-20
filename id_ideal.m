function idl=id_ideal(mas,N)
Len=floor(length(mas)*N);

idl=zeros(Len,1);
k=0;
m=1;
for j=1:Len
    if k<N
    value=mas(m);
    idl(j)=value;
    k=k+1;
    else 
        k=1;
        m=m+1;
        value=mas(m);
        idl(j)=value;
    end
end
end