function [sig,FrameNO]=genStdSig(t,fs,f,fir_coefs,mas,true_frm)
if nargin<5
    mas=1:32;
end
if nargin<6
    true_frm=0;
end
FrameNO=0;
out_GSS=GSS_generation(t,f,mas);
if true_frm
    winlen      = 25.6;             % window length in ms
    winshft     = 2.5;            % dense window shift in ms
    winlen=round(winlen*10^(-3)*fs);
    winshft=winshft*10^(-3)*fs;
    FrameNo=ceil((length(out_GSS)-winlen)/winshft);
    out_GSS = sig2frm(out_GSS, winlen, winshft, FrameNo);
    [winlen, framenum]=size(out_GSS); 
    % Hamming window each frame
    out_GSS = out_GSS .* (hamming(winlen) * ones(1, framenum));
end
out_nl=nolinear_elmnt(out_GSS);
sig = fftfilt(fir_coefs, out_nl);

% fft_sig=fft(out_nl,fft_size);
% Spec = abs(fft_sig(1: fft_size / 2,:));
% Spec=Spec./max(Spec);
% ppl=piople_tract(Spec);
% sig=Spec.*ppl';
end