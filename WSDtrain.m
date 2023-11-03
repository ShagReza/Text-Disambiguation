%-------------------------------------------------------------------------%
clc,clear all,close all;
%----------------------------------------------
% For New Words:
% Add meanning to WordsSencesMeaning.mat
% Add number of sences and the name of word sences to WordsSences.mat
%----------------------------------------------
% Train Models for each sences and put them to \Model folder
% Each Train file should be in a different text file 

% Input:
TrainPath='F:\NlpProject\941107\MainPrograms\TrainData';
dirTrainPath=dir(TrainPath);
for i=3:length(dirTrainPath)
    SenceTrainpath=[TrainPath,'\',dirTrainPath(i).name]; 
    dirSenceTrainpath=dir(SenceTrainpath);
    TrainVector=[];
    for j=3:length(dirSenceTrainpath)
        trainfile=[TrainPath,'\',dirTrainPath(i).name,'\',dirSenceTrainpath(j).name];
        Words=[];
        Words=ReadTextFile(trainfile);
        AmbiguousWords=ReadTextFile('AmbiguousWord.txt');
        [Iword,Iamb]=FindAmbiguousWords(AmbiguousWords,Words);
        TrainWords=[];
        TrainWords=ComputeTestVector(Words,Iword,10);
        TrainVector=BuildingTrainVector(TrainVector,TrainWords);
    end
    %-----------
    Num=[];
    for j=1:size(TrainVector,1), Num(j)=TrainVector{j,2}; end;
    a=[]; b=[];
    [a,b]=sort(Num,'descend');
    M=min(50,length(a));
    TrainWords=[];
    for j=1:M, TrainWords{1,j}=TrainVector{b(j),1}; end;
    A=dirTrainPath(i).name;
    
    save(['.\Models\',A],'TrainWords');
end



