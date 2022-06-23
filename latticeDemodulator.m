function dec = latticeDemodulator(msg, n)
%latticeDemodulator Summary of this function goes here
%   n the number of dimensions
%   msg modulated message
    ns = 2.^[0:n-1];
    f = floor(mod(msg,2*ns)./ns);
    dec = f;
end