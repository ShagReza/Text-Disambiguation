function TrainVector=BuildingTrainVector(TrainVector,TrainWords)
k=size(TrainVector,1);
for i=1:length(TrainWords)
    flag=0; Index=0;
    for j=1:size(TrainVector,1)
        if isequal(TrainWords{1,i},TrainVector{j,1})
            flag=1; Index=j;
        end
    end
    
    if flag==0
       k=k+1;
       TrainVector{k,1}=TrainWords{1,i};  TrainVector{k,2}=1;
    end
    
    if flag==1
        TrainVector{Index,2}=TrainVector{Index,2}+1;
    end
end