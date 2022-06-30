%Function that verifies if a complex integer matrix is positive semidefinite using Cholesky decomposition
%Input: a complex integer matrix M
%Output: 1 if PSD, 0 if not PSD
%Marco Túlio Quintino, https://github.com/mtcq

function out = IsPSDInt(M)
    try chol(sym(M));
        out=1;
    catch
        out=0;
    end
end
