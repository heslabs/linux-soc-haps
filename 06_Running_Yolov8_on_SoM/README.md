# Running Yolov8 on Cortex-CA53 SoM

1. Remote connect to the SoM silicon module, whcih is ZynqMP based FPGA SoC equpped with Cortex-A53
```
$ ssh xilinx@192.168.50.3 -X
Password: xilinx
```
2. Install the tflite-runtime,mediapipe,ultralytics (yolov8) and required Python library
```
$ pip install -y opencs-contrib-python tensorflow matplotlib pyscreenshot
$ pip install -y tflite-runtime
$ pip install -y mediapipe
$ pip install -y ultralytics
```
3. Launch Yolov8 Python script for objection detection
```
$ python ../src/yolov8n-image.py --image ../img/bus.jpg
# yolov8n-image.py
  i=0
  cap = cv2.VideoCapture(0)
  while cap.isOpened():
    results = model(frame)
    af=results[0].plot()
    etime=time.time()
    fps=round(1/(etime-stime),2)
    cv2.putText(frame,"FPS:" + str(fps),(10,50), cv2.FONT_HERSHEY_PLAIN, 3, (0, 0, 255), 3)
    cv2.imshow('m',af)
    ret, frame = cap.read() #ret=retval,frame=image
    results = model(frame)
    af=results[0].plot()
    etime=time.time()
    fps=round(1/(etime-stime),2)
    cv2.putText(frame,"FPS:" + str(fps),(10,50), cv2.FONT_HERSHEY_PLAIN, 3, (0, 0, 255), 3)
    cv2.imshow('m',af)
  i=0
  cap = cv2.VideoCapture(0)
  while cap.isOpened():
``` 

---
![image](https://github.com/user-attachments/assets/d9fa5ae3-cd81-4ec8-9bba-207795a43f6e)
