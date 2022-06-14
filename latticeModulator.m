function msg = latticeModulator(enc)
%latticeModulator Summary of this function goes here
%   enc the binary messages to be modulated
%   first column is the message of the finest lattice
    [l, dim] = size(enc);
    msg = sum(2.^[0:dim-1].*enc,2);
end