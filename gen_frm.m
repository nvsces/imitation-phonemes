function sig=gen_frm(input)
sig=[];
for i=1:size(input,2)
    out=input(:,i);
    sig=[sig; out];
end
end