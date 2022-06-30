%Function that creates a random Rank-1 POVM distributed in the Haar measure
%The Haar random unitary matrix is based on QETLAB's RandomUnitary (http://www.qetlab.com)

%Author: Marco Túlio Quintino, https://github.com/mtcq

function M = RandomPOVMrank1(d,nOut)
%Input: dimenions of the quantum system 'd' and number of outputs nOut
%Output: M(:,:,i), where M(:,:,i) is the POVM element of index i (M(:,:,i) is a d by d positive matrix)

%Test if the function input makes sense
if d>nOut
    error('The number of outputs cannot be smaller then the dimension d')
end

%We first create a Haar random unitary matrix from the Gibibre method
% Create a Ginibre matrix
gin = randn(nOut) + 1i*randn(nOut);
% QR decomposition of the Ginibre matrix
[Q,R] = qr(gin);

R = sign(diag(R));
R(R==0) = 1; % against potentially zero diagonal entries
U = bsxfun(@times,Q,R.'); % much faster than the naive U = Q*diag(R)

% We now create a Haar Random Isometry
V=U(1:d,:);

%We now perform this isometry in the computational basis for nOut
compBasis=zeros(nOut,nOut,nOut);
M = zeros(d,d,nOut);
for i=1:nOut
    compBasis(i,i,i)=1;
    M(:,:,i)= V*compBasis(:,:,i)*V';
end
end
