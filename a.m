function str=ReadTextFile(filepath)
%------------------------------------
fid=fopen(filepath);
str=fgetl(fid);
EndFile=0;
if str(1)==-1, EndFile=-1; end;
%------------------------------------
k=0;
while (EndFile==0 && fid~=-1)        
    %----------------------------------------------
    %Prprocessing:
    %Convert punctuations to space
    for i=1:length(str)
        if str(i)=='.'
            str(i)=' ';
        end
    end
    %Remove non words part of a string (space hazf nashavad)
    %RemoveNonWords!!!!!!!!!!!!!!!!!
    %-----------------------------------------------
    %read all words of a line
    %(words are seperated by a single space
    q = findstr(str,' ');
    n=1;
    for i=1:length(q)
        k=k+1;
        Words{1,k}=str(n:q(i)-1);
        n=q(i)+1;
    end
    if n<length(str), Words{1,i+1}=str(n:end); end;
    %------------------------------------------------   
    %Remove uninformative words
    %RemoveUninformativeWords
    %------------------------------------------------
    str=fgetl(fid);
    if str(1)==-1, EndFile=-1; end;
end
fclose(fid);

