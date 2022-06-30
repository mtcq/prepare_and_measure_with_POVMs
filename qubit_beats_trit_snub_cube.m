%This code considers a PM scenario where Alice prepares the 6 eigenvetors of Pauli matrices and Bob measures the 24 snub cube measurements.
%We show that the statistics of this scenario cannot be obtained by classical trits
%The user may adapt this code for arbitrary states, measurements, and classical dimensions
%Author: Marco Túlio Quintino, https://github.com/mtcq

clear all
tic

IA=6 % input Alice
dC=3 % message dimension
IB=24 % input Bob
OB=2; % output Bob

%Declare the 6 qubit states
ketbra0=[1 0;0 0];
ketbra1=[0 0;0 1];
ketbrap=[1 1;1 1]/2;
ketbram=[1 -1;-1 1]/2;
ketbrapY=[1 -1i; 1i 1]/2;
ketbramY=[1 1i; -1i 1]/2;
rho(:,:,1)=ketbra0;
rho(:,:,2)=ketbra1;
rho(:,:,3)=ketbrap;
rho(:,:,4)=ketbram;
rho(:,:,5)=ketbrapY;
rho(:,:,6)=ketbramY;

%Load the snub cube measurements
U=[1 0;0 exp(1i*pi/3)];
Mby=snubMeasurements(U);

%Construct the behaviour
for x=1:IA
    for y=1:IB
        for b=1:OB
            pbxy(b,x,y)=HS_real(rho(:,:,x),Mby(:,:,b,y));
        end
    end
end

%Run the linear programming and check that eta<1
[eta gamma]=PMWNR(pbxy,dC);
WhiteNoiseRobustness=eta

gamma=-gamma; %Set gamma as -gamma to use the convention that gamma<=C_d and not gamma>=C_d

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Computer assisted proof part %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=7; %We set 7 digits to prevent overflow. Int64 can store an integer up to 2^63~ 9x10^18
gammaINT=int64(10^N*gamma); %Make an integer version of the inequality
CboundINT=maxPMfastINT(gammaINT,dC) %Find the classical bound of gammaINT

rhoINT=int64(rho*10); %Store all rho as integers
%Make valid integer measurements
for y=1:IB
    MbyInt(:,:,:,y)=MakeIntMeasurement(Mby(:,:,:,y),N-1);
end
%Construct the behaviour from integer variables
for x=1:IA
    for y=1:IB
        for b=1:OB
            pbxyInt(b,x,y)=HSInt(rhoINT(:,:,x),MbyInt(:,:,b,y));
        end
    end
end

%Evaluates the score of the integer behaviour with gammaINT
scoreINT=0;
for x=1:IA
    for y=1:IB
        for b=1:OB
            scoreINT=scoreINT+pbxyInt(b,x,y)*gammaINT(b,x,y);
        end
    end
end
scoreINT=scoreINT

%Evalueates the score with floating point to compare the results
score=0;
for x=1:IA
    for y=1:IB
        for b=1:OB
            score=score+pbxy(b,x,y)*gamma(b,x,y);
        end
    end
end

scoreINTrenormalised_as_float=double(scoreINT)/10^(2*N)
initial_float_score=score
total_time_in_minutes=toc/60
