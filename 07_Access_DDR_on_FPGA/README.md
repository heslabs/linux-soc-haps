# Access DDR Memory on FPGA

1. Launch Python scripts on the target to write data into DDR memory
```
import numpy as np
import cv2
import time
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import mmap
img_bgr = cv2.imread('ddr_input.jpg')
img_h, img_w, img_c = img_bgr.shape
img_px = img_h*img_w*img_c
start = time.time()
fp = open("/dev/mem", mode="r+", encoding="utf8")
mmap_obj = mmap.mmap(fp.fileno(), length= img_px, access=mmap.ACCESS_WRITE,offset=0x01000000000)
img = img_bgr.reshape(img_px) ## reshape to 1-D
mmap_obj[::] = img[::]
end = time.time()
print("DDR Write (sec): " + str(end - start))
```

2. Launch Python scripts on the target to read data from DDR memory
```
mport numpy as np
import cv2
import time
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import mmap
img_bgr = cv2.imread('ddr_input.jpg')
img_h, img_w, img_c = img_bgr.shape
img_px = img_h*img_w*img_c
fp = open("/dev/mem", mode="r+", encoding="utf8")
mmap_obj = mmap.mmap(fp.fileno(), length=img_px, access=mmap.ACCESS_WRITE,offset=0x01000000000)
img = np.zeros(img_px, dtype=np.uint8)
start = time.time()
for n in range(img_px):
    img[n]= np.uint8(mmap_obj[n])
image = img.reshape(img_h,img_w,img_c)
cv2.imwrite('ddr_output.jpg', image)
end = time.time()
print("DDR Read (sec): " + str(end - start))
```
