#include <cstdio>
#include <cstring>
#include <iostream>
using namespace std;

const int maxn  = 16;
const int maxnn = 6666;

double w_x[maxn], w_y[maxn];

const double B[] = {0.0069331961301426059, 0.034665980650713031, 0.069331961301426062, 0.069331961301426062, 0.034665980650713031, 0.0069331961301426059};
const double A[] = {1, -1.9759016164414662, 2.013473026000308, -1.1026179777777696, 0.32761833400015672, -0.04070948961666522};

void Init() {
    memset(w_x, 0, sizeof(w_x));
    memset(w_y, 0, sizeof(w_y));
}

double Filter(double data) {
    double out;
    w_x[0] = data;
    w_y[0] = B[0] * w_x[0] + B[1] * w_x[1] + B[2] * w_x[2] + B[3] * w_x[3] + B[4] * w_x[4] + B[5] * w_x[5]
    - w_y[1] * A[1] - w_y[2] * A[2] - w_y[3] * A[3] - w_y[4] * A[4] - w_y[5] * A[5];
    out    = w_y[0] / A[0];

    w_x[5] = w_x[4];
    w_x[4] = w_x[3];
    w_x[3] = w_x[2];
    w_x[2] = w_x[1];
    w_x[1] = w_x[0];

    w_y[5] = w_y[4];
    w_y[4] = w_y[3];
    w_y[3] = w_y[2];
    w_y[2] = w_y[1];
    w_y[1] = w_y[0];

    return out;
}

int len = 0;
double va[maxnn], vx[maxnn], vy[maxnn], vz[maxnn];
double vxx[maxnn], vyy[maxnn], vzz[maxnn];

int main()
{
    freopen("MPU6050_RawGyroNoiseData.txt", "r", stdin);
    freopen("MPU6050_FilteredGyroData_fifth_order.txt", "w", stdout);

    double data;
    while(scanf("%f", &data) != EOF) {
        va[len] = data;

        scanf("%f %f %f", &vx[i], &vy[i], &vz[i]);
        len++;
    }

    Init();
    for(int i = 0; i < len; i++)
        vxx[i] = Filter(vx[i]);

    Init();
    for(int i = 0; i < len; i++)
        vyy[i] = Filter(vy[i]);

    Init();
    for(int i = 0; i < len; i++)
        vzz[i] = Filter(vz[i]);

    for(int i = 0; i < len; i++)
        printf("%f %f %f %f\n", va[i], vxx[i], vyy[i], vzz[i]);

    return 0;
}
