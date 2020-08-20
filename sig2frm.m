function wins=sig2fm(input,winlen,winshft,frameno)
input=input(:);     
wins=zeros(winlen, frameno);
for i=1:frameno
    b=round((i-1)*winshft);
    c=min(winlen,length(input)-b);
    wins(1:c,i)=input(b+1:min(length(input),b+winlen));
end