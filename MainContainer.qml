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

Row {
    id: mainContainer
    width: parent.width
    height: 720

    CurrentWeather {
        id: currentWeather
        //anchors.left: parent.left
    }

    Image {
        source: "images/verBorder.png"
        height: 700
    }

    Forecast {
        id: forecast
    }

    Menu {

    }

    function onLoad(jsonObject)
    {
        currentWeather.onLoad(jsonObject)
        forecast.onLoad(jsonObject)
        /*
        var weather = jsonObject.data.weather[0]
        day0.setDay(weather.date, weather.tempMinC, weather.tempMaxC, weather.weatherIconUrl[0].value);
        weather = jsonObject.data.weather[1]
        day1.setDay(weather.date, weather.tempMinC, weather.tempMaxC, weather.weatherIconUrl[0].value);
        weather = jsonObject.data.weather[2]
        day2.setDay(weather.date, weather.tempMinC, weather.tempMaxC, weather.weatherIconUrl[0].value);
        weather = jsonObject.data.weather[3]
        day3.setDay(weather.date, weather.tempMinC, weather.tempMaxC, weather.weatherIconUrl[0].value);
        weather = jsonObject.data.weather[4]
        day4.setDay(weather.date, weather.tempMinC, weather.tempMaxC, weather.weatherIconUrl[0].value);
        */
    }

    function setSpeedUnits(unit) {
        forecast.setSpeedUnits(unit)
        currentWeather.setSpeedUnits(unit)
    }

    function setDegreeUnits(unit) {
        forecast.setDegreeUnits(unit)
        currentWeather.setDegreeUnits(unit)
    }
}
