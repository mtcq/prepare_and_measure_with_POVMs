%Heaviside function
%Input: a real number x
%Output: 0 if x<0, 1 if x>=0
%This function is considerable faster than Matlab's build in Heaviside function
%Marco Túlio Quintino, https://github.com/mtcq

function H=HeavisideMTQ(x)
if x<0
    H=0;
else
    H=1;
end
end
