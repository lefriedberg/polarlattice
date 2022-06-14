%based on https://ecse.monash.edu/staff/eviterbo/polarcodes.html

%% Lattice Parameters 
n=2; %for now this is hardcoded I don't even know
sigma = .45;
pe = 10^-5;
alpha = 1; %MMSE scaling

%chain: Z/2Z/4Z, it's too annoying to fix this vector issue
capacities = chaincaps(n,sigma);
ctotal = sum(capacities);


%% Polar Code
chan = comm.AWGNChannel('NoiseMethod','Variance','Variance',sigma^2);

N = 1024;
K = floor(N.*capacities);
in1 = randi([0 1],K(1),1);
in2 = randi([0 1],K(2),1);
enc1 = nrPolarEncode(in1,N);
enc2 = nrPolarEncode(in2,N);
msg = latticeModulator([enc1,enc2]);
rcv = chan(msg);
demod = latticeDemodulator(rcv,n,alpha); 
L = 8;
out1 = nrPolarDecode(demod(1),K(1),N,L);
out2 = nrPolarDecode(demod(2),K(2),N,L);
numBitErrs = biterr(out1,in1) + biterr(out2,in2)