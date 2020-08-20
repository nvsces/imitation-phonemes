function fb=my_ftb(frame,fs,mpoint)
flow=0;
fheigth=fs/2;


mlow=mel(flow);
mh=mel(fheigth);

ml=linspace(mlow,mh,mpoint);
h=mel2f(ml);
f = floor( (frame+1) * h / fs);

for m=2:mpoint-1
    for k=1:frame/2
        if k<f(m-1)
            fb(m-1,k)=0;
        elseif (k>=f(m-1) && k<=f(m))
            fb(m-1,k)=(k-f(m-1))/(f(m)-f(m-1));
        elseif (k>=f(m) && k<=f(m+1))
            fb(m-1,k)=(f(m+1)-k)/(f(m+1)-f(m));
        else
            fb(m-1,k)=0;
        end
    end
end
end

function mels=mel(freq)
% change frequency from Hz to mel
mels=1127*log(1+(freq/700));
end

function F=mel2f(m)
F=700*(exp(m/1127)-1);
end