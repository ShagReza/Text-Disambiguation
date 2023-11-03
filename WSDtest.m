%-------------------------------------------------------------------------%
%----------------------  NLP Final Project -------------------------------%
%------------------- word sense disambiguation ---------------------------%
%-------------------------------------------------------------------------%

                 %---------------------------------%
                 %--- Shaghayegh Reza (94543004)---%
                 %---------------------------------%
                 
%-------------------------------------------------------------------------%
clc,clear all,close all;
%----------------------------------------------
% input: tex+t file path
filepath='F:\NlpProject\941107\MainPrograms\C.txt';
%----------------------------------------------
% Read Text File and Remove Non Words:
Words=ReadTextFile(filepath);
%----------------------------------------------
% Find Ambiguous Word:
AmbiguousWords=ReadTextFile('AmbiguousWord.txt');
[Iword,Iamb]=FindAmbiguousWords(AmbiguousWords,Words);
%----------------------------------------------
% POS Tagging:
%----------------------------------------------
% Remove Uniformative Words:
%----------------------------------------------
% Disambiguation With POS Tags:
%----------------------------------------------
% Stemming:
%----------------------------------------------
% Disambiguation:
TestWords=ComputeTestVector(Words,Iword,10);
load('WordsSences.mat');
for i=1:WordsSences{Iamb,1}
    %TrainWords=ReadTextFile(['Models\',WordsSences{Iamb,i+1}]);
    A=WordsSences{Iamb,i+1}; A(end-3:end)=[];
    load(['.\Models\',A,'.mat']);
    Score(i)=ComputeScore(TrainWords,TestWords);
end
[Max,InMax]=max(Score);
%----------------------------------------------
% Write Results:
load('WordsSencesMeaning.mat');
WordsSencesMeaning{Iamb,InMax}
%----------------------------------------------

