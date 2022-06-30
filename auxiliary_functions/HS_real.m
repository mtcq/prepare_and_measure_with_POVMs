%Function that evaluates the real Hilbert-Schmidt inner product between two matrices A,B
%Input: A pair or matrices A and B
%Output: real(trace(A'*B))
%This is useful to reduce complexity and reduce numerical imprecision
%A=A', B=B', HS(A,B) is always real, hence this function prevents erros
%Marco Túlio Quintino, https://github.com/mtcq

function out=HS_real(A,B)
out=real(A(:)'*B(:));
end
