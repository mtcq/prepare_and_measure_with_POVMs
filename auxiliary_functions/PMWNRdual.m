%Function which implements the white noise robustness LP for PM scenarios via the dual formulation
%Input:  a probability distribution pbxy(b,x,y) and a classical dimension dC
%Output: the critical visibility eta and a classical dimension witness gamma
%Author: Marco Túlio Quintino, https://github.com/mtcq

function [eta gammaWitness]=PMWNRdual(pbxy,dC)
Ob=size(pbxy,1);
Ia=size(pbxy,2);
Ib=size(pbxy,3);

Daxl=Dax_MATRIX(dC,Ia);
nL=dC^Ia;  %Count the deterministic vertices

% p(b|xy) = \sum_aL p_B(b|yaL) p_A(a|xL)
cvx_begin SDP
variable gammaWitness(Ob,Ia,Ib)
variable s(Ib,dC,nL)
expression gammaWitnesssum

gammaWitnesssum=sum(sum(sum(gammaWitness)))/Ob;
gammaWitnesssum==1+gammaWitness(:)'*pbxy(:);

for L=1:nL
    sum(sum(s(:,:,L)))==0;
    for y=1:Ib
        for c=1:dC
            for b=1:Ob
                vec(gammaWitness(b,:,y))'*vec(Daxl(c,:,L))>=s(y,c,L)
            end
        end
    end
end

minimise gammaWitnesssum
cvx_end

eta=gammaWitnesssum;
end

