%This function generates phonemes with the specified codes

%t        - time counts
%fs       - sample rate
%f        - vector of basic frequencies
%fir_oefs - filter coefficients
%mas      - codes of phonemes

%true_frm  = 1 - signal is     divided into frames
%true_frm  = 0 - signal is not divided into frames

function [sig]=genStdSig(t,fs,f,fir_coefs,mas,true_frm)
if nargin<5
    mas=1:32;
end
if nargin<6
    true_frm=0;
end
out_GSS=GSS_generation(t,f,mas);
if true_frm
    winlen=round(25.6e-3*fs);
    out_GSS = sig2frm(out_GSS, winlen);
    [winlen, framenum]=size(out_GSS); 
    % Hamming window each frame
    out_GSS = out_GSS .* (hamming(winlen) * ones(1, framenum));
end
out_nl=nolinear_elmnt(out_GSS);
sig = fftfilt(fir_coefs, out_nl);

end