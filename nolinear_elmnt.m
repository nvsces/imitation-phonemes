function out=nolinear_elmnt(input)
a=100*rand;
b=100*rand;
c=100*rand;
d=100*rand;
f=100*rand;
for i=1:5
    q(i)=rand;
    if q(i)<0.5
        q(i)=0;
    else 
        q(i)=1;
    end
end
out=input+q(1)*a*input.^2+q(2)*b*input.^3+q(3)*c*input.^4+q(4)*d*input.^5+q(5)*f*input.^6;
end