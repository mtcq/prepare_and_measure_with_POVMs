%Function which evaluates classical dC-dimensional bound of a PM witness (maximisation)
%Input:  a set of numbers gamma(b,x,y) and a classical dimension dC
%Output: the classical bound Cbound
%Author: Marco Túlio Quintino, https://github.com/mtcq

function Cbound=maxPMfast(gamma,dC)

Ob=size(gamma,1);
Ia=size(gamma,2);
Ib=size(gamma,3);

Daxl=Dax_MATRIX(dC,Ia);
nL=dC^Ia;  %Count the deterministic vertices

maxnow=0;
Cbound=-10^15; %Initialise Cbound as a very small value

for L=1:nL
    aux=0;
    MA=zeros(dC,Ob,Ib);
    for a=1:dC
        for b=1:Ob
            for y=1:Ib
                for x=1:Ia
                    MA(a,b,y)=MA(a,b,y)+gamma(b,x,y)*Daxl(a,x,L);
                end
            end
        end
    end
    
    for a=1:dC
        for y=1:Ib
            maxnow=maxnow+max(MA(a,:,y));
        end
    end

    if maxnow>Cbound
        Cbound=maxnow;
    end
    maxnow=0;
end

end

