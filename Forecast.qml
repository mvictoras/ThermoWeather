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
    id: forecast
    spacing: 20
    width: 519
    // 5 day forecast

    Image {
        id: forecastGradient
        source: "images/HeaderGradient.png"
        width: forecast.width
        height: 34
        x: 20

        Text {
            text: app.lang['5 Day Forecast']
            font.family: "Trajan Pro"
            font.pointSize: 16
            font.bold: true
            anchors.left: forecastGradient.left
            anchors.verticalCenter: forecastGradient.verticalCenter
            anchors.leftMargin: 10
            color: "white"
        }
    }

    Day {
        id: day0
        mDay: "MON"
        index: 0
    }

    Day {
        id: day1
        mDay: "TUE"
        index: 1
    }

    Day {
        id: day2
        mDay: "WED"
        index: 2
    }

    Day {
        id: day3
        mDay: "THU"
        index: 3
    }

    Day {
        id: day4
        mDay: "FRI"
        index: 4
    }

    function onLoad(jsonObject)
    {
        day0.setDay(jsonObject, 0);
        day1.setDay(jsonObject, 1);
        day2.setDay(jsonObject, 2);
        day3.setDay(jsonObject, 3);
        day4.setDay(jsonObject, 4);

    }

    function setSpeedUnits(unit) {
        day0.setSpeedUnits(unit)
        day1.setSpeedUnits(unit)
        day2.setSpeedUnits(unit)
        day3.setSpeedUnits(unit)
        day4.setSpeedUnits(unit)
    }

    function setDegreeUnits(unit) {
        day0.setDegreeUnits(unit)
        day1.setDegreeUnits(unit)
        day2.setDegreeUnits(unit)
        day3.setDegreeUnits(unit)
        day4.setDegreeUnits(unit)
    }

}
