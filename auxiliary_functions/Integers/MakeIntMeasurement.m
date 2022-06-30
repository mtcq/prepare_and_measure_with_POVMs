%Function that subtracts complex integer matrices
%Input: a POVM M(:,:,i), and the decial precision
%Output: a POVM with integers multiplied by 10^N
%Marco Túlio Quintino, https://github.com/mtcq

function MInt=MakeIntMeasurement(M,N)
d=size(M,1);
Nout=size(M,3);
Msum=0;
for i=1:Nout-1
    M(:,:,i)=(M(:,:,i)+eye(d)*10^(-N))/(1+10^(-N)*3); %ensure that MInt will be PSD
    MInt(:,:,i)=int64(M(:,:,i)*10^N);
    MInt(:,:,i)=AddInt(MInt(:,:,i),AdjointInt(MInt(:,:,i)));
    MInt(:,:,i)=TimesInt(MInt(:,:,i),1/2);
    if IsPSDInt(MInt(:,:,i))==0
        error('The matrix is not positive semidfinite!!')
    end
    Msum=AddInt(Msum,MInt(:,:,i));
end
MInt(:,:,Nout)=SubInt(int64(eye(d)*10^N),Msum);

if IsPSDInt(MInt(:,:,Nout))==0
  error('The last matrix is not positive semidfinite!!')
end
end
