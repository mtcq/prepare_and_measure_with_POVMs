%Function that evaluates the Hilbert-Schmidt inner product between two integer matrices A,B
%Input: A pair or matrices A and B
%Output: trace(A'*B)
%This is useful to reduce complexity and reduce numerical imprecision
%Marco Túlio Quintino, https://github.com/mtcq

function out=HSInt(A,B)
a=A(:);
b=B(:);
b=transpose(ConjInt(b));

out=0;
for i=1:size(a,1)
    out=AddInt(out,TimesInt(a(i),b(i)));
end
