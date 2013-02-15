Description
=============
ThermoWeather is a Weather Station made entirely in QML. The displayed data is polled from worldweatheronline.com.

Features of ThermoWeather
=========================
* Current conditions outside: temperature, humidity, precipitation, wind speed, wind direction, clouds coverage, visibility and weather description
* The predictions for the day: temperature min, max, precipitation, wind speed, wind direction, weather description
* 5 day forecast: temperature min, max, precipitation, wind speed, wind direction, weather description
* The current condition and forecasted weather is represented by graphic representation
* Displays the temperature and humidity inside the building (Because no sensors are available, this information is hard-coded)
* Supports changing the location
* Resolution of 1280x800
* Touch-screen compatible
* Multiple language support (currently supports 4 languages)
* Support for US/European system
* Displays weather alerts (the weather alerts are not real, but hard-coded)

Source Code
===========
You can download the source code of the application here: https://github.com/mvictoras/ThermoWeather
git clone https://github.com/mvictoras/ThermoWeather

Running
===========
To run you need Qt 5.0.1 installed.

Configuration
=============

To run the app you need to register to worldweatheronline.com and get a key. Registration is free. After you have a key, edit ThermoWeather.qml and set your key:
property string key: "KEY_GOES_HERE"

Windows
=======
qmlscene.exe ThermoWeather.qml

Mac OSX / Linux
===============
qmlscene ThermoWeather.qml
