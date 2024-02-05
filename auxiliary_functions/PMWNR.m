%Function which implements the white noise robustness LP for PM scenarios
%Input:  a probability distribution pbxy(b,x,y) and a classical dimension dC
%Output: the critical visibility eta and a classical dimension witness gamma
%Author: Marco Túlio Quintino, https://github.com/mtcq

function [eta gamma]=PMWNR(pbxy,dC)

OB=size(pbxy,1);
IA=size(pbxy,2);
IB=size(pbxy,3);

Daxl=Dax_MATRIX(dC,IA);
nL=dC^IA;  %Count the deterministic vertices

% p(b|xy) = \sum_aL p_B(b|yaL) p_A(a|xL)
cvx_begin
variable pB_byaL(OB,IB,dC,nL) nonnegative
variable eta
dual variable gamma{OB,IA,IB}

for b=1:OB
    for x=1:IA
        for y=1:IB
            gamma{b,x,y} : eta*pbxy(b,x,y) +  (1-eta)/OB == vec(pB_byaL(b,y,:,:))'*vec(Daxl(:,x,:));
        end
    end
end

for y=1:IB
    for c=1:dC
        if y ~= 1 || c ~= 1
            sum(pB_byaL(:,y,c,:),1) == sum(pB_byaL(:,1,1,:),1)
        end
    end
end

maximise eta
cvx_end
gamma=cell2mat(gamma);

end
