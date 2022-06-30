function [qubits] = ThomsonStates(n)
%This code creates a family of n qubit density matrices which are "well spread"
%the distribution of states on the Bloch sphere comes from the ThomsonProblem
%Input: an integer n, the number of desired qubit states
%Output: a set of density matrices sorted as rho(:,:,i)
%Marco Túlio Quintino, https://github.com/mtcq
n_half=floor(n/2);
v=ThomsonProblem(n_half);

count=0;
for i=1:n_half
    count=count+1;
    qubits(:,:,count)=Bloch2Rho(v(i,:));
    count=count+1;
    qubits(:,:,count)=Bloch2Rho(-v(i,:));
end

if mod(n,2)==1
    %qubits(:,:,count+1)=RandomDensityMatrix(2,0,1);
    qubits(:,:,count+1)=[1 0;0 0];
end