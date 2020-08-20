function out=ver_idx(idx,N)
step=0;
out=[];
for j=2:length(idx)
    k=idx(j)-idx(j-1);
    if k==0
        step=step+1;
    else 
        if step>N
          temp=idx(j-step-1:j-1);
          out=[out;temp];
          step=0;
        else 
            step=0;
        end
    end
end
if step>N
          temp=idx(j-step:j-1);
          out=[out;temp];
end
end