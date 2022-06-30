function [M] = ThomsonMeasurements(n)
%This code creates a family of n qubit projective measurements "well spread"
%the distribution of POVM elements on the Bloch sphere comes from the ThomsonProblem
%Input: an integer n, the number of desired qubit measurements
%Output: a set of density matrices sorted as Max(:,:,a,x), where a stands for output and x for the number of inputs (goes to n)
%Marco Túlio Quintino, https://github.com/mtcq

v=ThomsonProblem(n);
for i=1:n
    M(:,:,1,i)=Bloch2Rho(v(i,:));
    M(:,:,2,i)=eye(2)-M(:,:,1,i);
end


end