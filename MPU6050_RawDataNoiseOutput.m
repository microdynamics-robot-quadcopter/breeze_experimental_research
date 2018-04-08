clear all;
clc;

is_gyro = 0;

if is_gyro == 1
    data = load('./MPU6050_RawGyroNoiseData.txt');
    x  = data(:, 1);
    y1 = data(:, 2);
    y2 = data(:, 3);
    y3 = data(:, 4);
    
    subplot(3, 2, 1);
    plot(x, y1);
    xlabel('t/s');
    ylabel('Amplitude/LSB');
    title('GYRO X Axis');

    subplot(3, 2, 2);
    plot(abs(fft(y1)));
    xlabel('f/Hz');
    ylabel('Amplitude/LSB');

    subplot(3, 2, 3);
    plot(x, y2);
    xlabel('t/s');
    ylabel('Amplitude/LSB');
    title('GYRO Y Axis');

    subplot(3, 2, 4);
    plot(abs(fft(y2)));
    xlabel('f/Hz');
    ylabel('Amplitude/LSB');

    subplot(3, 2, 5);
    plot(x, y3);
    xlabel('t/s');
    ylabel('Amplitude/LSB');
    title('GYRO Z Axis');

    subplot(3, 2, 6);
    plot(abs(fft(y3)));
    xlabel('f/Hz');
    ylabel('Amplitude/LSB');
else
    data = load('./MPU6050_RawAccNoiseData.txt'); 
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
    
 

