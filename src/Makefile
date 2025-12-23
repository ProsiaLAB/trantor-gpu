NVCC = nvcc
TARGET = main

$(TARGET): main.cu
	$(NVCC) -std=c11 -O3 main.cu -o $(TARGET)

clean:
	rm -f $(TARGET)
