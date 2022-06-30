%Function that adds complex integers (also work for complex integer matrices)
%Input: A pair of matrices A and B
%Output: A+B
%Marco Túlio Quintino, https://github.com/mtcq

function out=AddInt(A,B)
out=complex(real(A)+real(B),imag(A)+imag(B));
end
