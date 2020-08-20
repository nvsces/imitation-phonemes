function out=piople_tract(input_fft)

x=linspace(0,4000,size(input_fft,1));
xdata=[30 60 70 200 300 450 600 1000 2000 3000 3500 4000];
ydata=[40 60 70 70 70 65 60 55 55 45 45 45];
out = interp1(xdata, ydata, x,'spline');
out=out./max(abs(out));

% a=1177965655164e-20;
% b=5846392510190992e-20;
% c=4219184084202254326e-20;
% d=37.231;
% 
% out=a*x.^3-b*x.^2+c*x-d;

end