%Function that transforms a qubit density matrix into a BlochVector
%Input: a 2-dimensional complex matrix
%Output: The corresponding BlochVector, if Rho is a density matrix, the BlochVector has norm 1,
%Marco Túlio Quintino, https://github.com/mtcq

function [Bloch] = Rho2Bloch(Rho)
X=[0 1;1 0];
Y=[0 -sqrt(-1);sqrt(-1) 0];
Z=[1 0;0 -1];
Bloch(1)= trace(X*Rho);
Bloch(2)= trace(Y*Rho);
Bloch(3)= trace(Z*Rho);
Bloch=Bloch'; %Ensure that we have a column vector vector
end
