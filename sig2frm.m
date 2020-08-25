%The function divides the signal into frames

%input     - input signal
%winlen    - frame length
%count_frm - number of frames
%out_frm   - output signal

function out_frm=sig2frm(input,winlen)
    
    count_frm=round(length(input)/winlen)
    input=input(:);
    out_frm=zeros(winlen,count_frm);
    b=0;
    for i=1:count_frm
        a=b+1;
        b=a+winlen-1;
        out_frm(1:winlen,i)=input(a:b); 
    end
end