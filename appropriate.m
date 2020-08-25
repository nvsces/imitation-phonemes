%The function calculates the ratio of correctly
%guessed imitation phonemes to the total number of phonemes

%mas-initial sequence of phonemes
%idx-guessed sequence of phonemes

function prbt=appropriate(mas,idx)
count =0; 

for i=1:length(idx)
    if (idx(i)==mas(i)) count=count+1;
end
    prbt=count/length(idx);
end