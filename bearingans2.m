
arr = load("bearingtest.csv"); 
x = arr(:,2); %time in seconds
y = arr(:,1); %rolling speed
D = 0.5; %pitch diameter
d = 0.6; %ball diameter
a = pi/4; %contact angle
n = 7; %number of rolling elements
F_s = 100; %sampling frequency
T = 1/F_s; %smpling period
L = 1; %length of signal
t = (0:L-1)*T; %time vector
nq = F_s / 2; %nyquist frequency






me = mean(y);
DC_off = y - me; %dc offset removed
f_ss = DC_off + 2*randn(size(t));  %signal with dc offset and random noise
bpfo = ((n*f_s)/2)*(1 + (d/D)*cos(a)); %ball pass frequency outer race
bpfi = ((n*f_s)/2)*(1 - (d/D)*cos(a)); %ball pass frequency inner race
ftf =  ((f_s)/2)*(1 - (d/D)*cos(a)); %fundamnetal train frequency
bsf = ((D*f_s)/2)*(1 - ((d/D)*cos(a))^2); %ball pass frequency inner race
%plot(DC_off) %plotting of dc offest
fast = fft(f_ss); %fft transform
mod = modulate(y,10,F_s);%modulating signal


%plot(F_s/L*(0:L-1),abs(fast))


spectrogram(fast);
kurt = spectralKurtosis(x,fast);
spectralKurtosis(x,fast)





%plot(F_s/L*(-L/2:L/2-1),fftshift(fast),"LineWidth",1)








