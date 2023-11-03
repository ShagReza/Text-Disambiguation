function Score=ComputeScore(TrainWords,TestWords)
Score=0;
for i=1:length(TrainWords)
    for j=1:length(TestWords)
        if isequal (TrainWords{1,i}, TestWords{1,j})
            Score=Score+1;
        end
    end
end