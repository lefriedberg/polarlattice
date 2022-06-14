function caps = chaincaps(n,sigma)
    %capacities of Z/nZ sigma
    caps = 1:n;

    for i = 1:n
        caps(i) = capacity(i, sigma)-capacity(i-1,sigma);
    end

end
