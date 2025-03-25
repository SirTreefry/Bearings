
arr = load("bearingtest.csv"); 
x = arr(:,2); %time in seconds
y = arr(:,1); %rolling speed
D = 0.5; %pitch diameter
d = 0.6; %ball diameter
a = pi/4; %contact angle
n = 7; %number of rolling elements
f_s = y ; %rolling speed

bpfo = ((n*f_s)/2)*(1 + (d/D)*cos(a)); %ball pass frequency outer race
bpfi = ((n*f_s)/2)*(1 - (d/D)*cos(a)); %ball pass frequency inner race
ftf =  ((f_s)/2)*(1 - (d/D)*cos(a)); %fundamnetal train frequency
bsf = ((D*f_s)/2)*(1 - ((d/D)*cos(a))^2); %ball pass frequency inner race
M = max(y);

F_s = 1000; %sampling frequency
T = 1/F_s; %smpling period
L = 100; %length of signal
t = (0:L-1)*T; %time vector
%AM = (1 + M*sin(2*pi*f_s*x))
fast = fft(y); %fft transform
f_c = max(fast); %carrier signal 
mod = modulate(y,100,F_s);




%plot(F_s/L*(0:L-1),abs(trans),"LineWidth",3)


%plot(F_s/L*(-L/2:L/2-1),abs(fftshift(trans)),"LineWidth",1)








