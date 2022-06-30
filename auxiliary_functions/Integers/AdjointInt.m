%Function that outputs the adjoint of complex integer matrices
%Input: A
%Output: A'
%Marco Túlio Quintino, https://github.com/mtcq

function out=AdjointInt(A)
out=transpose(ConjInt(A));
end
