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

Item {
    id: app
    width: 1280; height: 800

    property string key: "YOUR_KEY_GOES_HERE"


    property string activeCity: "Chicago"
    property string activeCountry: "images/flags/us.png"
    property string countryCode: "us"
    property var lang: app.lang = {
                           'Humidity': "Humidity",
                           'Visibility': "Visibility",
                           'Precipitation': "Precipitation",
                           'Cloud Cover': "Cloud Cover",
                           'Weather Station': "Weather Station",
                           '5 Day Forecast': "5 Day Forecast",
                           'Menu': "Menu",
                           'Language': "Language",
                           'Units': "Units",
                           'Location': "Location",
                           'Set': "Set",
                           'at': "at",
                           '395': "Moderate or heavy snow in area with thunder",
                           '392': "Patchy light snow in area with thunder",
                           '389': "Moderate or heavy rain in area with thunder",
                           '386': "Patchy light rain in area with thunder",
                           '377': "Moderate or heavy showers of ice pellets",
                           '374': "Light showers of ice pellets",
                           '371': "Moderate or heavy snow showers",
                           '368': "Light snow showers",
                           '365': "Moderate or heavy sleet showers",
                           '362': "Light sleet showers",
                           '359': "Torrential rain shower",
                           '356': "Moderate or heavy rain shower",
                           '353': "Light rain shower",
                           '350': "Ice pellets",
                           '338': "Heavy snow",
                           '335': "Patchy heavy snow",
                           '332': "Moderate snow",
                           '329': "Patchy moderate snow",
                           '326': "Light snow",
                           '323': "Patchy light snow",
                           '320': "Moderate or heavy sleet",
                           '317': "Light sleet",
                           '314': "Moderate or Heavy freezing rain",
                           '311': "Light freezing rain",
                           '308': "Heavy rain",
                           '305': "Heavy rain at times",
                           '302': "Moderate rain",
                           '299': "Moderate rain at times",
                           '296': "Light rain",
                           '293': "Patchy light rain",
                           '284': "Heavy freezing drizzle",
                           '281': "Freezing drizzle",
                           '266': "Light drizzle",
                           '263': "Patchy light drizzle",
                           '260': "Freezing fog",
                           '248': "Fog",
                           '230': "Blizzard",
                           '227': "Blowing snow",
                           '200': "Thundery outbreaks in nearby",
                           '185': "Patchy freezing drizzle nearby",
                           '182': "Patchy sleet nearby",
                           '179': "Patchy snow nearby",
                           '176': "Patchy rain nearby",
                           '143': "Mist",
                           '122': "Overcast",
                           '119': "Cloudy",
                           '116': "Partly Cloudy",
                           '113': "Clear/Sunny",
                           'MON': "Monday",
                           'TUE': "Tuesday",
                           'THU': "Thursday",
                           'WED': "Wednesday",
                           'FRI': "Friday",
                           'SAT': "Saturday",
                           'SUN': "Sunday"
                       }
    state: "languageClosed"

    Image {
        source: "images/Background.png"
        asynchronous: true
        cache: true
        //anchors.top: parent.top
    }

    // This is a row
    Time {
        id: time

    }

    // This is the container
    MainContainer {
        id: mainContainer
        anchors.top: time.bottom
    }

    // And the alert!
    Alert {
        anchors.top: mainContainer.bottom

    }

    LanguageSelector {
        id: languageSelector

    }

    function onLoad(jsonObject)
    {
        mainContainer.onLoad(jsonObject)
    }

    Component.onCompleted: {
        loadCity("Chicago")
    }

    function loadCity(city) {
        activeCity = city
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
           if (doc.readyState == XMLHttpRequest.DONE) {
               var jsonObject = eval('(' + doc.responseText + ')');
               if( jsonObject.data.error !== "undefined") {
                onLoad(jsonObject);
               }
            }
        }
        // Replace YOURPRIVATEKEY by your key from free.worldweatheronline.com
        doc.open("GET", "http://free.worldweatheronline.com/feed/weather.ashx?q=" + activeCity + " &format=json&num_of_days=5&key=" + key);
        doc.send();
    }

    Item {
        Timer {
            interval: 1000 * 60
            running: true
            repeat: true
            onTriggered: loadCity(app.activeCity);
        }
     }

    property var dayCode:
    {
        395: 17,
        392: 17,
        389: 17,
        386: 17,
        377: 25,
        374: 25,
        371: 16,
        368: 16,
        365: 12,
        362: 11,
        359: 12,
        356: 12,
        353: 11,
        350: 25,
        338: 14,
        335: 14,
        332: 42,
        329: 42,
        326: 13,
        323: 13,
        320: 06,
        317: 06,
        314: 10,
        311: 10,
        308: 12,
        305: 12,
        302: 09,
        299: 09,
        296: 09,
        293: 09,
        284: 07,
        281: 07,
        266: 05,
        263: 05,
        260: 19,
        248: 21,
        230: 14,
        227: 13,
        200: 00,
        185: 08,
        182: 08,
        179: 15,
        176: 09,
        143: 19,
        122: 26,
        119: 28,
        116: 30,
        113: 32
    }




    property var nightCode: { 122: 10 }

    states: [
        State {
            name: "languageOpen"
            PropertyChanges { target: languageSelector; x: 0}
        },
        State {
            name: "languageClosed"
            PropertyChanges { target: languageSelector; x: 1280 * 2}
        }
    ]

    transitions: [
        Transition {
            from: "languageOpen"
            to: "languageClosed"
            PropertyAnimation { properties: "x"; easing.type: Easing.InOutQuad; duration: 1200 }

        },
        Transition {
            from: "languageClosed"
            to: "languageOpen"
            PropertyAnimation { properties: "x"; easing.type: Easing.InOutQuad; duration: 1200 }
        }
    ]

}
