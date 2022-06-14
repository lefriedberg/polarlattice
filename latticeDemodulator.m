function dec = latticeDemodulator(msg, n, alpha)
%latticeDemodulator Summary of this function goes here
%   n the number of dimensions
    ns = 2.^[0:n-1];
    dec = floor(mod(alpha*msg,2*ns)./ns);
end