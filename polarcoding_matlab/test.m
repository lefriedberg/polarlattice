N=1024; 
n=2; % z/2Z/4Z % it doesn't work if it's not 2 LOL
sigma = .45;
pe = 10^-5;
alpha = 1; %1+SNR/SNR

capacities = chaincaps(n,sigma);
ctotal = sum(capacities);
Ec=2; 
N0=2*sigma^2;
K = floor(N.*capacities);

global PCparams;
initPC(N,K(2),Ec,N0,1,1);
frz1 = pcc(N,K(1),PCparams.designSNRdB);
frz2 = pcc(N,K(2),PCparams.designSNRdB);
shp = frz1~=frz2;
in = randi([0 1],K(2),2); 
u1 = pencode(in1(:,1));
u2 = pencode(in1(:,2));
x_mod = latticeModulator([u1 u2]);
y_rcv = chan(x_mod); %AWGN that isn't bad
[y1 y2]= latticeDemodulator(y_rcv,2,alpha);
u_decoded= pdecode(y1); %SUCCESSIVE CANCELLATION DECODING
sum(u1~=u1)