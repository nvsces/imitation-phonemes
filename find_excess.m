function out_logic=find_excess(sig,fs,disp)
if nargin<3 
    disp=0; 
end

[WT,frq]=cwt(sig,'bump',fs);
WT_abs=abs(WT);
WT_mean=mean(WT_abs,1);
if disp
    t=1:size(SP,1);
    pcolor(t,frq,WT_abs);
    shading interp;
end
[~,locs] = findpeaks(WT_mean);

if length(locs)>2
    out_logic=1;
else 
    out_logic=0;
end

end