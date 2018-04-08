clear all;
clc;

is_gyro = 1;

if is_gyro == 1
    data = load('./MPU6050_RawGyroData.txt');
    x  = data(:, 1);
    y1 = data(:, 2);
    y2 = data(:, 3);
    y3 = data(:, 4);

    subplot(3, 1, 1);
    plot(x, y1);
    xlabel('t/s');
    ylabel('Amplitude/LSB');
    title('GYRO X Axis');

    subplot(3, 1, 2);
    plot(x, y2);
    xlabel('t/s');
    ylabel('Amplitude/LSB');
    title('GYRO Y Axis');

    subplot(3, 1, 3);
    plot(x, y3);
    xlabel('t/s');
    ylabel('Amplitude/LSB');
    title('GYRO Z Axis');
else
    data = load('./MPU6050_RawAccData.txt');
    x  = data(:, 1);
    y1 = data(:, 2);
    y2 = data(:, 3);
    y3 = data(:, 4);

    subplot(3, 1, 1);
    plot(x, y1);
    xlabel('t/s');
    ylabel('g/(m/s^2)');
    title('ACC X Axis');

    subplot(3, 1, 2);
    plot(x, y2);
    xlabel('t/s');
    ylabel('g/(m/s^2)');
    title('ACC Y Axis');

    subplot(3, 1, 3);
    plot(x, y3);
    xlabel('t/s');
    ylabel('g/(m/s^2)');
    title('ACC Z Axis');
end
