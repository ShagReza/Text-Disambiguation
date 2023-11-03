
function [Iword,Iamb]=FindAmbiguousWords(AmbiguousWords,Words)
Iword=1; Iamb=1;
for i=2:length(Words)
    for j=2: length(AmbiguousWords)
        if isequal(Words{1,i},AmbiguousWords{1,j})
            Iword=i;
            Iamb=j;
        end
    end
end