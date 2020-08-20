function out_gm=gmm_learning(f,fs,t,fft_size,numcf,fir_coefs)
if nargin<1 f=[290 1559 2139 456 987]; end
if nargin<2 fs=8000;end
if nargin<3 t=0:1/fs:500*1/fs;end
if nargin<4 fft_size=512;end
if nargin<5 numcf=16;end

for j=1:32
    cf=[];
    for i=1:20
    sig_in=genStdSig(t,fs,f,fir_coefs,j,1);
    cf_temp=mfcc_my(sig_in,fs,fft_size,numcf,0);
    cf=[cf;cf_temp];
    end
    gm=fitgmdist(cf,1,'RegularizationValue',0.1);
    mu(j,:)=gm.mu;
    sigma{j}=gm.Sigma;
end
std3=cell2std3(sigma);
out_gm = gmdistribution(mu,std3);
end