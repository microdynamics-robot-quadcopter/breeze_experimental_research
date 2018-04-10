clear all;
clc;

is_gyro = 1;

if is_gyro == 1
    data1 = load('./MPU6050_RawGyroNoiseData.txt');
    data2 = load('./MPU6050_FilteredGyroData_second_order.txt');
%     data2 = load('./MPU6050_FilteredGyroData_fifth_order.txt');
    x1  = data1(:, 1);
    y11 = data1(:, 2);
    y12 = data1(:, 3);
    y13 = data1(:, 4);
    
    x2  = data2(:, 1);
    y21 = data2(:, 2);
    y22 = data2(:, 3);
    y23 = data2(:, 4);
    
    subplot(3, 2, 1);
    plot(x1, y11, x2, y21, 'r');
    axis([3 13 -0.2 0.2]);
    xlabel('t/s');
    ylabel('Amplitude/LSB');
    title('GYRO X Axis');
    legend('Raw Noise Data','Filtered Data')
    
    subplot(3, 2, 2);
    plot(abs(fft(y11))); hold on;
    plot(abs(fft(y21)), 'r'); hold on;
    axis([0 1400 0 20]);
    xlabel('f/Hz');
    ylabel('Amplitude/LSB');
    legend('Raw Noise Data','Filtered Data')
    
    subplot(3, 2, 3);
    plot(x1, y12, x2, y22, 'r');
    axis([3 13 -0.15 0.1]);
    xlabel('t/s');
    ylabel('Amplitude/LSB');
    title('GYRO Y Axis');
    legend('Raw Noise Data','Filtered Data')
    
    subplot(3, 2, 4);
    plot(abs(fft(y12))); hold on;
    plot(abs(fft(y22)), 'r'); hold on;
    axis([0 1400 0 40]);
    xlabel('f/Hz');
    ylabel('Amplitude/LSB');
    legend('Raw Noise Data','Filtered Data')
    
    subplot(3, 2, 5);
    plot(x1, y13, x2, y23, 'r');
    axis([3 13 -0.05 0.15]);
    xlabel('t/s');
    ylabel('Amplitude/LSB');
    title('GYRO Z Axis');
    legend('Raw Noise Data','Filtered Data')
    
    subplot(3, 2, 6);
    plot(abs(fft(y13))); hold on;
    plot(abs(fft(y23)), 'r'); hold on;
    axis([0 1400 0 25]);
    xlabel('f/Hz');
    ylabel('Amplitude/LSB');
    
    legend('Raw Noise Data','Filtered Data')
else
    data = load('./MPU6050_FilterAccData.txt'); 
    x  = data(:, 1);
    y1 = data(:, 2);
    y2 = data(:, 3);
    y3 = data(:, 4);
    
    subplot(3, 2, 1);
    plot(x, y1);
    xlabel('t/s');
    ylabel('g/(m/s^2)');
    title('ACC X Axis');

    subplot(3, 2, 2);
    plot(abs(fft(y1)));
    xlabel('f/Hz');
    ylabel('Amplitude/LSB');

    subplot(3, 2, 3);
    plot(x, y2);
    xlabel('t/s');
    ylabel('g/(m/s^2)');
    title('ACC Y Axis');

    subplot(3, 2, 4);
    plot(abs(fft(y2)));
    xlabel('f/Hz');
    ylabel('Amplitude/LSB');

    subplot(3, 2, 5);
    plot(x, y3);
    xlabel('t/s');
    ylabel('g/(m/s^2)');
    title('ACC Z Axis');

    subplot(3, 2, 6);
    plot(abs(fft(y3)));
    xlabel('f/Hz');
    ylabel('Amplitude/LSB');
end
