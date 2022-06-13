import subprocess
from flask import Flask, request, Response, render_template
import RPi.GPIO as GPIO
import time
import Adafruit_DHT


class SensorData:
    
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)

    PIR_input = 17
    Flame_input = 2
    Soil_Moisture_pin = 4
    temp_and_humid_Sensor = Adafruit_DHT.DHT11
    temp_pin = 27
    
    GPIO.setup(Soil_Moisture_pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(Flame_input, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(PIR_input, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

    def detect_motion(self):
        if GPIO.input(self.PIR_input):
            subprocess.call("python inference.py", shell=True)
            return True

        # print("Motion Detected")
        else:
            return False
        # print("No Motion Detected")

    def detect_flame(self):
        if GPIO.input(self.Flame_input):
            return True
        # print("No Flame Detected")
        else:
            return False
        # print("Flame Detected")

    def detect_temperature_humidity(self):
        humidity, temperature = Adafruit_DHT.read_retry(self.temp_and_humid_Sensor, self.temp_pin)
        if humidity is not None and temperature is not None:
            return temperature, humidity
        else:
            return 0,0

    def detect_water(self):
        if GPIO.input(self.Soil_Moisture_pin):
            return True
            # print("No Water Detected")
        else:
            return False
            # print("Water Detected")

        # while True:
             

app = Flask(__name__)

@app.route("/")
def getData():
    data = SensorData()
    data_dict = {}
    while True:
    
        data_dict['motion_status'] = data.detect_motion()
        data_dict['flame_status'] = data.detect_flame()
        data_dict['temperature'], data_dict['humidity'] = data.detect_temperature_humidity()
        data_dict['moisture_status'] = data.detect_water()
        time.sleep(2)
        return (data_dict)
        

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True, port=8080)
    

    




