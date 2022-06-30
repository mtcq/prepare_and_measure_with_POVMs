%Function that outputs the conjugate of complex integer matrices
%Input: A
%Output: conj(A)
%Marco Túlio Quintino, https://github.com/mtcq

function out=ConjInt(A)
out=complex(real(A),-imag(A));
end
