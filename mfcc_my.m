function coef=mfcc_my(sig_in,fs,fft_size,numcf,dsp)

fft_sig=fft(sig_in,fft_size);
Spec = abs(fft_sig(1: fft_size / 2,:));
Spec=Spec./max(Spec);

ftb=my_ftb(2*size(Spec,1),fs,numcf+2);
Summa=zeros(size(Spec,2),numcf);
for j=1:size(Spec,2)
    Sp=Spec(:,j);
    S=Sp'.*ftb;
    Su=sum(S,2);
    Summa(j,:)=Su;
    Slog(j,:)=log(Su);
end
if dsp    
    mel_t=linspace(0,2500,size(Summa,2));
    figure; plot(mel_t,Summa,'k');
    title('Cглаженный mel-спектр');
    xlabel('Частота, mel');
    grid on; grid minor;
end
if dsp
    figure; plot(Slog,'k');
    title('P(m)');
    xlabel('Номер коэффициента');
    grid on; grid minor;
end
coef=dct(Slog,[],2);

end