%Function that creates a uniformly random complex normalised vector
%The Haar random unitary matrix is based on QETLAB's RandomUnitary (http://www.qetlab.com)
%Input: dimenions d
%Output: random d-dimensional complex vector
%Author: Marco Túlio Quintino, https://github.com/mtcq

function ket = RandomKet(d)
%We first create a Haar random unitary matrix from the Gibibre method
% Create a Ginibre matrix
gin = randn(d) + 1i*randn(d);
% QR decomposition of the Ginibre matrix
[Q,R] = qr(gin);

R = sign(diag(R));
R(R==0) = 1; % against potentially zero diagonal entries
U = bsxfun(@times,Q,R.'); % much faster than the naive U = Q*diag(R)

ket0=zeros(d,1);
ket0(1)=1;
ket=U*ket0;
end
