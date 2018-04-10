f = [0 0.2 0.2 1];
m = [1 1 0 0];
n1 = 3;
[b1, a1] = yulewalk(n1, f, m);
[h1, w1] = freqz(b1, a1);

plot(f, m, w1 / pi, abs(h1), '.g'); hold on;

n2 = 5;
[b2, a2] = yulewalk(n2, f, m);
[h2, w2] = freqz(b2, a2);

plot(w2 / pi, abs(h2), '+r'); hold on;

n3 = 8;
[b3, a3] = yulewalk(n3, f, m);
[h3, w3] = freqz(b3, a3);

plot(w3 / pi, abs(h3), '*c'); hold on;

% f = [0 0.6 0.6 1];
% m = [1 1 0 0];
% [b,a] = yulewalk(8,f,m);
% [h,w] = freqz(b,a);
% plot(f,m,w/pi,abs(h),'--'); hold on;
% [b1, a1] = yulewalk(3,f,m);
% [h1, w1] = freqz(b1, a1);
% plot(f,m,w1/pi,abs(h1))
legend('Ideal','third order', 'fifth order', 'eighth order')
title('Comparison of Frequency Response Magnitudes')