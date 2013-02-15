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
    id: day
    property string mDay: "MON"
    property string degreeUnits: "C"
    property string speedUnits: "km/h"
    property real precip: 0.0
    property int aLowC: 0
    property int aLowF: 0
    property int aHighC: 0
    property int aHighF: 0
    property int index

    x: 20
    width: day.parent.width

    Text {
        text: mDay
        width: 64
        font.family: "Tamil MN"
        font.bold: true
        font.pointSize: 21
        font.capitalization: Font.AllUppercase
        color: "black"
        //horizontalAlignment: Text.AlignHCenter
    }

    Row {
        height: 90
        Column {
            Image {
                id: img
                source: "images/weatherIcons/34.png"
                width: 64
                height: 64
            }

            Text {
                id: weatherDesc
                text: app.lang['116']
                font.family: "Stone Sans Sem ITC TT"
                font.pointSize: 18
                color: "black"
                width: img.width
                //horizontalAlignment: Text.AlignHCenter
            }
        }

        Column {
            // maxTemp
            Text {
                id: high
                text: "60"
                width: 50
                font.family: "Stone Sans Sem ITC TT"
                font.pointSize: 25
                textFormat: Text.RichText
                color: "white"
                x: 6
                //horizontalAlignment: Text.AlignHCenter
            }

            // minTemp
            Text {
                id: low
                text: "30"
                width: 50
                font.family: "Stone Sans Sem ITC TT"
                font.pointSize: 17
                textFormat: Text.RichText
                color: "#191919"
                horizontalAlignment: Text.AlignHCenter
                x: 6
            }
        }

        Column {
            spacing: 10
            width: day.parent.width - 269
            Image {
                id: precipitationGradient
                source: "images/gradient.png"
                width: day.parent.width - 348
                height: 25
                x: 50

                Text {
                    text: app.lang['Precipitation']
                    font.family: "Trajan Pro"
                    font.pointSize: 14
                    font.bold: true
                    anchors.left: precipitationGradient.left
                    anchors.verticalCenter: precipitationGradient.verticalCenter
                    anchors.leftMargin: 10
                    color: "white"
                }
            }

            Text {
                id: precipitation
                text: "60 %"
                width: precipitationGradient.width
                font.family: "Trajan Pro"
                font.pointSize: 21
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                x: 50
            }


        }

        WindCompass {
            id: windCompass
            fontSize: 11
            scale: 0.5
        }

    }

    Image {
        source:  "images/horBorder.png"
        width: day.parent.width - 59
        x: ( index == 4) ? 1000 : 0
    }


    function setDay( jsonObject, index ) {
        var weather = jsonObject.data.weather[index];
        var aDay = weather.date;
        aLowC = weather.tempMinC;
        aHighC = weather.tempMaxC;
        aLowF = weather.tempMinF;
        aHighF = weather.tempMaxF;
        var aImage = weather.weatherIconUrl[0].value;
        day.precip = weather.precipMM
        var windDirection = weather.winddirection
        var windSpeedKMH = weather.windspeedKmph
        var windSpeedMPH = weather.windspeedMiles
        var windDegree = weather.winddirDegree
        var aWeatherDesc = weather.weatherDesc[0].value
        var weatherCode = weather.weatherCode

        mDay = getDayOfDate(aDay);
        if( degreeUnits == "C" ) {
            high.text = aHighC +  "° " + degreeUnits;
            low.text = aLowC + "° " + degreeUnits;
        } else {
            high.text = aHighF +  "° " + degreeUnits;
            low.text = aLowF + "° " + degreeUnits;
        }

        img.source = "images/weatherIcons/" + app.dayCode[weatherCode] + ".png";
        precipitation.text = day.precip.toFixed(1) + " mm"
        weatherDesc.text = app.lang[weatherCode]

        windCompass.set(windDirection, windSpeedKMH, windSpeedMPH, windDegree)
    }

    function getDayOfDate(aDate) {
        var myDate = new Date(aDate)
        return app.lang[Qt.formatDateTime( myDate, "dddd" ).substring(0, 3).toUpperCase()]
    }

    function setSpeedUnits(unit) {
        windCompass.setSpeedUnits(unit)

        degreeUnits = unit
        if(unit === "km/h") {
            precipitation.text = day.precip.toFixed(1) + " mm"
        } else {
            precipitation.text = (day.precip * 0.0393701).toFixed(1) + " in"
        }
    }

    function setDegreeUnits(unit) {
        if( unit === "C") {
            degreeUnits = "C"
            high.text = aHighC +  "° " + degreeUnits;
            low.text = aLowC + "° " + degreeUnits;
        } else {
            degreeUnits = "F"
            high.text = aHighF +  "° " + degreeUnits;
            low.text = aLowF + "° " + degreeUnits;
        }

    }

}
