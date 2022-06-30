%Function that transforms a Bloch vector into a density matrix
%Input: a 3-dimensional real vector BlochVector
%Output: The corresponding matrix Rho, if BlochVector nas norm 1, Rho is a density matrix
%Marco Túlio Quintino, https://github.com/mtcq

function [Rho] = Bloch2Rho(BlochVector)
Rho =1/2*[1+BlochVector(3), BlochVector(1)-sqrt(-1)*BlochVector(2); BlochVector(1)+sqrt(-1)*BlochVector(2), 1-BlochVector(3)];
end
