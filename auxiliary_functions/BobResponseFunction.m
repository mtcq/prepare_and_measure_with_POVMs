%Response function used by Bob in the qubit PM model
%Input:  lambdavec,Mvec,pb
%Output: The probability of Bob outputing b when 
%Author: Marco Túlio Quintino, https://github.com/mtcq

function pB=BobResponseFunction(lambdavec,Mvec,pb)
    pB=NaN(1,size(Mvec,2)); %Variable which will store the distribution
    denominator=0;
    for b=1:size(Mvec,2)
        denominator=denominator+pb(b) * HeavisideMTQ(lambdavec'*Mvec(:,b)) * lambdavec'*Mvec(:,b);
        %pause
    end
    
    for b=1:size(Mvec,2)
        pB(b)=real(pb(b) * HeavisideMTQ(lambdavec'*Mvec(:,b)) * lambdavec'*Mvec(:,b)/denominator);
    end
    
end
