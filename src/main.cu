#include <stdio.h>

__global__ void add(const float *a, const float *b, float *c, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
        c[i] = a[i] + b[i];
}

int main(void) {
    int n = 1024;
    float *a, *b, *c;

    cudaMallocManaged(&a, n * sizeof(float));
    cudaMallocManaged(&b, n * sizeof(float));
    cudaMallocManaged(&c, n * sizeof(float));

    for (int i = 0; i < n; i++) {
        a[i] = i;
        b[i] = 2 * i;
    }

    add<<<(n + 255) / 256, 256>>>(a, b, c, n);
    cudaDeviceSynchronize();

    printf("%f\n", c[10]);

    cudaFree(a);
    cudaFree(b);
    cudaFree(c);
    return 0;
}
