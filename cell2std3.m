function std3=cell2std3(std_)
std3=[];
for i=1:length(std_)
    std3(:,:,i)=std_{i};
end
end