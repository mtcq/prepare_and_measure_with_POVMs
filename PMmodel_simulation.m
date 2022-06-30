%Script that implements our qubit PM model with two bits of communication
%The user may adjust the parameters N (number of rounds), OB (number of outputs), fix the state ket_rho, or fix the measurements Mb

%Author: Marco Túlio Quintino, https://github.com/mtcq

clear all; %clc;
tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ADJUSTABLE PARAMETERS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=10^7 %Number of rounds of the simulation
OB=4 %Number of outputs for Bob
ket_rho=RandomKet(2);
Mb=RandomPOVMrank1(2,OB); %Pick Random Rank1 POVMs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ADJUSTABLE PARAMETERS %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d=2; %set qubit dimension
vecx=Rho2Bloch(ket_rho*ket_rho');
countB=zeros(OB);

%Set auxiliary measurement functions
for b=1:OB
    pb(b)=trace(Mb(:,:,b))/2;
    vecy(:,b)=Rho2Bloch(Mb(:,:,b)/trace(Mb(:,:,b)));
end

%Evaluate quantum probability
for b=1:OB
    pQ(b)=real(ket_rho'*Mb(:,:,b)*ket_rho);
end

% Start simulation
for i=1:N
    ketLambda1=RandomKet(d); %Random pure state
    ketLambda2=RandomKet(d); %Random pure state
    Lambda1vec=Rho2Bloch(ketLambda1*ketLambda1');
    Lambda2vec=Rho2Bloch(ketLambda2*ketLambda2');
    %%% Define Alice's strategy
    % First, Alice set the bits c1 and c2
    if vecx'*Lambda1vec>=0
        c(1)=1;
    else
        c(1)=-1;
    end
    if vecx'*Lambda2vec>=0
        c(2)=1;
    else
        c(2)=-1;
    end
    
    %%% Define Bob's response function
    % Bob first chose a random POVM element index i2 according to pb
    i2 = 1+sum(rand >= cumsum(pb));
    
    % Bob will now set lambda
    if abs(vecy(:,i2)'*Lambda1vec)>=abs(vecy(:,i2)'*Lambda2vec)
        lambdavec=c(1)*Lambda1vec;
    else
        lambdavec=c(2)*Lambda2vec;
    end
    pBM=BobResponseFunction(lambdavec,vecy,pb);
    
    pB=pBM;
    b = 1+sum(rand >= cumsum(pB)); %Output a following the distribution pB
    
    countB(b)=countB(b)+1;
end


for b=1:OB
    relativeSimulFrequency(b)=countB(b)/N;
end

relativeSimulFrequency=relativeSimulFrequency
pQ=pQ

difference=abs(relativeSimulFrequency-pQ)
total_time_in_minutes=toc/60
