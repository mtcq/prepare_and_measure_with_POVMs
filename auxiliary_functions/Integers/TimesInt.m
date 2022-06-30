%Function that multiplies complex integer
%Input: a pair of complex integers a and b
%Output: a*b
%Marco Túlio Quintino, https://github.com/mtcq

function out=TimesInt(a,b)
out=complex(real(a)*real(b)-imag(a)*imag(b),real(a)*imag(b)+ imag(a)*real(b));
end
