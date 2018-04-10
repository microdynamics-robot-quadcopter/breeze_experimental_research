#include <cstdio>
#include <cstring>
#include <iostream>
using namespace std;

const int maxn  = 16;
const int maxnn = 6666;

double w_x[maxn], w_y[maxn];

const double B[] = {0.13110643991662596, 0.26221287983325192, 0.13110643991662596};
const double A[] = {1, -0.74778917825850344,  0.27221493792500728};

void Init() {
    memset(w_x, 0, sizeof(w_x));
    memset(w_y, 0, sizeof(w_y));    
}

double Filter(double data) {
    double out;

    w_x[0] = data;
    w_y[0] = B[0] * w_x[0] + B[1] * w_x[1] + B[2] * w_x[2] - w_y[1] * A[1]
    - w_y[2] * A[2];
    out    = w_y[0] / A[0];

    w_x[2] = w_x[1];
    w_x[1] = w_x[0];

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
    freopen("MPU6050_FilteredGyroData_second_order.txt", "w", stdout);

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
