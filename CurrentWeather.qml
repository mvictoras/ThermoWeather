/**
* Copyright (c) <2013>, <Victor Mateevitsi> www.vmateevitsi.com
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
* 1. Redistributions of source code must retain the above copyright
*    notice, this list of conditions and the following disclaimer.
* 2. Redistributions in binary form must reproduce the above copyright
*    notice, this list of conditions and the following disclaimer in the
*    documentation and/or other materials provided with the distribution.
* 3. All advertising materials mentioning features or use of this software
*    must display the following acknowledgement:
*    This product includes software developed by the <organization>.
* 4. Neither the name of the <organization> nor the
*    names of its contributors may be used to endorse or promote products
*    derived from this software without specific prior written permission.

* THIS SOFTWARE IS PROVIDED BY <COPYRIGHT HOLDER> ''AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
*	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
*	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
*	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*/

import QtQuick 2.0

Column {
    id: currentWeather

    property string degreeUnits: "C"
    property int aHighC: 0
    property int aHighF: 0
    property real precip: 0.0
    property int stationC: 25
    property int stationF: 77

    width: 558
    spacing: 50
    Grid {
        columns: 2
        Image {
            id: weatherImage
            source: "images/weatherIcons/34.png"
            width: 256
            height: 256

        }

        Column {
            id: col
            spacing: 12
            property int offset: 50
            Text {
                id: city
                text: app.activeCity
                font.family: "Stone Sans Sem ITC TT"
                font.pointSize: 48
                color: "black"
                x: col.offset
            }

            Text {
                id: high
                text: "96 F"
                font.family: "Stone Sans Sem ITC TT"
                font.pointSize: 75
                color: "white"
                x: col.offset
            }

            Text {
                id: observationTime
                text: "(" + app.lang['at'] + " " + Qt.formatDateTime(new Date(), "hh:mmAP") + ")"
                font.family: "Stone Sans Sem ITC TT"
                font.pointSize: 14
                color: "#191919"
                x: col.offset
            }
        }

        Text {
            id: weatherDesc
            text: "Sunny"
            font.family: "Stone Sans Sem ITC TT"
            font.pointSize: 30
            color: "black"
            width: weatherImage.width
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Row {
        x: 50
        Column {
            width: 330
            spacing: 10

            // Humidity
            Image {
                id: humidityGradient
                source: "images/gradient.png"
                width: 245
                height: 34

                Text {
                    text: app.lang['Humidity']
                    font.family: "Trajan Pro"
                    font.pointSize: 16
                    font.bold: true
                    anchors.left: humidityGradient.left
                    anchors.verticalCenter: humidityGradient.verticalCenter
                    anchors.leftMargin: 10
                    color: "white"
                }

                Text {
                    id: humidity
                    text: "10"
                    font.family: "Trajan Pro"
                    font.pointSize: 16
                    font.bold: true
                    color: "white"
                    anchors.right: humidityGradient.right
                    anchors.verticalCenter: humidityGradient.verticalCenter
                    anchors.rightMargin: 30
                }
            }

            // Visibility
            Text {
                id: visibilityText
                text: app.lang['Visibility']
                font.family: "Trajan Pro"
                font.pointSize: 16
                font.bold: true
                x: 10
                color: "white"
                width: 235

                Text {
                    id: visibility
                    text: "10"
                    font.family: "Trajan Pro"
                    font.pointSize: 16
                    font.bold: true
                    color: "white"
                    anchors.right: visibilityText.right
                    anchors.verticalCenter: visibilityText.verticalCenter
                    anchors.rightMargin: 30
                }
            }

            // Precipitation
            Image {
                id: precipitationGradient
                source: "images/gradient.png"
                width: 245
                height: 34

                Text {
                    text: app.lang['Precipitation']
                    font.family: "Trajan Pro"
                    font.pointSize: 16
                    font.bold: true
                    anchors.left: precipitationGradient.left
                    anchors.verticalCenter: precipitationGradient.verticalCenter
                    anchors.leftMargin: 10
                    color: "white"
                }

                Text {
                    id: precipitation
                    text: "10"
                    font.family: "Trajan Pro"
                    font.pointSize: 16
                    font.bold: true
                    color: "white"
                    anchors.right: precipitationGradient.right
                    anchors.verticalCenter: precipitationGradient.verticalCenter
                    anchors.rightMargin: 30
                }
            }

            // Cloud Cover
            Text {
                id: cloudcoverText
                text: app.lang['Cloud Cover']
                font.family: "Trajan Pro"
                font.pointSize: 16
                font.bold: true
                x: 10
                color: "white"
                width: 140

                Image {
                    id: cloudgradient
                    source: "images/cloudCover.png"
                    width: 115
                    height: 25
                    anchors.left: cloudcoverText.right
                    anchors.verticalCenter: cloudcoverText.verticalCenter

                    Image {
                        id: cloudArrow
                        source: "images/cloudArrow.png"
                        width: 5
                        height: cloudgradient.height
                    }
                }

            }
        }

        WindCompass
        {
            id: windCompass
        }
    }

    Column {

        // Weather Station Header
        Image {
            id: weatherStationGradient
            source: "images/HeaderGradient.png"
            width: 519
            height: 34
            x: 20

            Text {
                text: app.lang['Weather Station']
                font.family: "Trajan Pro"
                font.pointSize: 16
                font.bold: true
                anchors.left: weatherStationGradient.left
                anchors.verticalCenter: weatherStationGradient.verticalCenter
                anchors.leftMargin: 10
                color: "white"
            }
        }

        Text {
            id: weatherStationDegree
            width: weatherStationGradient.width
            text: stationC + "° C"
            font.family: "Stone Sans Sem ITC TT"
            font.pointSize: 48
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        // Humidity
        Image {
            id: humidityStationGradient
            source: "images/gradient.png"
            width: 245
            height: 34
            x: 50

            Text {
                text: app.lang['Humidity']
                font.family: "Trajan Pro"
                font.pointSize: 16
                font.bold: true
                anchors.left: humidityStationGradient.left
                anchors.verticalCenter: humidityStationGradient.verticalCenter
                anchors.leftMargin: 10
                color: "white"
            }

            Text {
                text: "10%"
                font.family: "Trajan Pro"
                font.pointSize: 16
                font.bold: true
                color: "white"
                anchors.right: humidityStationGradient.right
                anchors.verticalCenter: humidityStationGradient.verticalCenter
                anchors.rightMargin: 30
            }
        }


    }

    function onLoad(jsonObject)
    {
        initWeatherCodes();
        var weather = jsonObject.data.current_condition[0];
        //var aLow = weather.tempMinC;
        aHighC = weather.temp_C;
        aHighF = weather.temp_F;
        var aImage = weather.weatherIconUrl[0].value;
        precip = weather.precipMM
        var windDirection = weather.winddir16Point
        var windSpeedKMH = weather.windspeedKmph
        var windSpeedMPH = weather.windspeedMiles
        var windDegree = weather.winddirDegree
        var aCloudCover = weather.cloudcover
        var aHumidity = weather.humidity
        var aObservationTime = parseTime(weather.observation_time)
        var aVisibility = weather.visibility
        var aWeatherDesc = weather.weatherDesc[0].value
        var weatherCode = weather.weatherCode

        if( degreeUnits == "C") {
            high.text = aHighC +  "° " + degreeUnits;
        } else {
            high.text = aHighF +  "° " + degreeUnits;
        }
        weatherImage.source = "images/weatherIcons/" + app.dayCode[weatherCode] + ".png";
        precipitation.text = precip.toFixed(1) + " mm"
        visibility.text = aVisibility + "%"
        humidity.text = aHumidity + "%"
        observationTime.text = "("  + app.lang['at'] + " " + aObservationTime + ")"
        weatherDesc.text = app.lang[weatherCode]
        cloudArrow.x = (aCloudCover / 100) * (cloudgradient.width - cloudArrow.width)

        windCompass.set(windDirection, windSpeedKMH, windSpeedMPH, windDegree)


    }

    function initWeatherCodes (){
        //dayCode[122] = 10;
    }

    function parseTime(aTime) {
        var myDate = new Date("1/1/2012 " + aTime + " UTC")
        //myDate.setUTCDate(aTime)
        return myDate.toLocaleTimeString()
    }

    function setSpeedUnits(unit) {
        windCompass.setSpeedUnits(unit)

        if(unit === "km/h") {
            precipitation.text = precip.toFixed(1) + " mm"
        } else {
            precipitation.text = (precip * 0.0393701).toFixed(1) + " in"
        }

    }

    function setDegreeUnits(unit) {
        if( unit === "C") {
            degreeUnits = "C"
            high.text = aHighC +  "° " + degreeUnits;
            weatherStationDegree.text = stationC +  "° " + degreeUnits;
        } else {
            degreeUnits = "F"
            high.text = aHighF +  "° " + degreeUnits;
            weatherStationDegree.text = stationF +  "° " + degreeUnits;
        }
    }
}
