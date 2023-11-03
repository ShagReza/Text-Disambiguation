function TestVector=ComputeTestVector(Words,Iword,N)
a=Iword-N; if a<1, a=1; end;
b=Iword+N; if b>length(Words), b=length(Words); end;
TestVector=[];
k=0;
for i=a:b
    k=k+1;
    TestVector{1,k}=Words{1,i};
end
