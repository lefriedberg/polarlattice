%% Test
N=128; K=64; Ec=1; N0=2; %0dB SNR
initPC(N,K,Ec,N0);
u= (rand(K,1)>0.5); %message
x= pencode(u); % POLAR ENCODING
y= (2*x-1)*sqrt(Ec) + sqrt(N0/2)*randn(N,1); %AWGN
u_decoded= pdecode(y); %SUCCESSIVE CANCELLATION DECODING
logical(sum(u==u_decoded)) %Check if properly decoded
%% Plot
N=128; K=64; EbN0range=0:0.4:2; designSNRdB=0;
plotPC(N,K,EbN0range,designSNRdB,0);