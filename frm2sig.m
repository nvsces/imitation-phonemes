%The function receives a whole signal from the frames

function sig=frm2sig(input)
sig=[];
for i=1:size(input,2)
    out=input(:,i);
    sig=[sig; out];
end
end