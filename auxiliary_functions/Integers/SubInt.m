%Function that subtracts complex integer matrices
%Input: a pair of matrices A and B
%Output: A-B
%Marco Túlio Quintino, https://github.com/mtcq

function out=SubInt(A,B)

    out=complex(real(A)-real(B),imag(A)-imag(B));

end
