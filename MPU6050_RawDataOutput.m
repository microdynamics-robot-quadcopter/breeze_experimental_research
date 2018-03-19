clear all;
clc;

data2=load('./MPU6050_RawGyroData.txt'); 
x=data2(:,1);
y1=data2(:,2);
y2=data2(:,3);
y3=data2(:,4);

subplot(3, 1, 1);
plot(x,y1);
xlabel('t/s');
ylabel('Amplitude/LSB');
title('GYRO X Axis');

subplot(3, 1, 2);
plot(x,y2);

xlabel('t/s');
ylabel('Amplitude/LSB');
title('GYRO Y Axis');

subplot(3, 1, 3);
plot(x,y3);

xlabel('t/s');
ylabel('Amplitude/LSB');
title('GYRO Z Axis');

