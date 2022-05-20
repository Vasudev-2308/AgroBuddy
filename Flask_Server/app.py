from flask import Flask, request, Response, render_template
import RPi.GPIO as GPIO
import time
import Adafruit_DHT


class SensorData:
    data_dict = {}
    IR_input = 11
    Flame_input = 3
    Soil_Moisture_pin = 7
    temp_and_humid_Sensor = Adafruit_DHT.DHT11
    temp_pin = 27

    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(Soil_Moisture_pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(Flame_input, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(IR_input, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

    def detect_motion(self):
        if GPIO.input(self.IR_input):
            self.data_dict['motion_status'] = True

        # print("Motion Detected")
        else:
            self.data_dict['motion_status'] = False
        # print("No Motion Detected")

    def detect_flame(self):
        if GPIO.input(self.Flame_input):
            self.data_dict['flame_status'] = True
        # print("No Flame Detected")
        else:
            self.data_dict['flame_status'] = False
        # print("Flame Detected")

    def detect_temperature_humidity(self):
        humidity, temperature = Adafruit_DHT.read_retry(self.temp_and_humid_Sensor, self.temp_pin)
        if humidity is not None and temperature is not None:
            self.data_dict['temperature'] = temperature
            self.data_dict['humidity'] = humidity
        else:
            return {}

    def detect_water(self):
        if GPIO.input(self.Soil_Moisture_pin):
            self.data_dict['moisture_status'] = True
            # print("No Water Detected")
        else:
            self.data_dict['moisture_status'] = True
            # print("Water Detected")

    def __init__(self):
        
        #while True:
        self.detect_motion()
        self.detect_flame()
        self.detect_temperature_humidity()
        self.detect_water()

        
                    

    def get_values(self):
        return self.data_dict


app = Flask(__name__)


@app.route("/")
def getAllData():
    data = SensorData()
    data_dict = data.get_values()
    return (data_dict)
    


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)
