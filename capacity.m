function C = capacity(n,sigma)
    %capacity of the lattice nZ
    tailsize = -floor(-10*sigma/2^n);
    lambda = [-tailsize:tailsize]*2^n;
    delta = min(sigma/10000, 1/10000);
    x = [-2^(n-1):delta:2^(n-1)].';
    
    f_x = sum(1/sqrt(2*pi.*sigma.^2)*exp(-(x-lambda).^2./(2*sigma.^2)),2);
    hx = sum(-f_x.*log2(f_x+eps)*delta);

    C = n - hx;

end