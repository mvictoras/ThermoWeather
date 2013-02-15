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


Image {
    id: windSpeedImg

    property int fontSize: 21
    property real scale: 1
    property string speedUnits: "km/h"
    property int windSpeedKMH: 0
    property int windSpeedMPH: 0

    source: "images/windSpeed.png"
    width: 128 * scale
    height: 128 * scale

    Image {
        id: arrow
        source: "images/WindArrowSmall.png"
        width: 20 * windSpeedImg.scale
        height: 64 * windSpeedImg.scale
        x: windSpeedImg.width / 2 - width / 2
        //anchors.centerIn: windSpeedImg
        //transformOrigin: Item.Bottom
        //transform:
        //rotation: 0

        transform: [
            //Translate { y: -22 },

            Rotation {
                id: arrowRot

                origin.x: arrow.width / 2;
                origin.y: arrow.height;
                //axis.x:0; axis.y:1; axis.z:0
                angle:180

                //Behavior on angle { PropertyAnimation{} }
            }
        ]


    }

    // Wind Direction
    Text {
        id: direction
        text: "NW"
        width: windSpeedImg.width
        font.family: "Helvetica"
        font.pointSize: fontSize
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.centerIn: windSpeedImg
    }

    // Wind Speed
    Text {
        id: speed
        text: "10m/h"
        width: windSpeedImg.width
        font.family: "Helvetica"
        font.pointSize: fontSize
        font.bold: true
        anchors.top: windSpeedImg.bottom
        anchors.topMargin: 5
        horizontalAlignment: Text.AlignHCenter

    }

    function set(windDirection, windSpeedKMH, windSpeedMPH, windDegree) {
        direction.text = windDirection
        if( speedUnits == "km/h") {
            speed.text = windSpeedKMH + " " + speedUnits
        } else {
            speed.text = windSpeedMPH + " " + speedUnits
        }
        windSpeedImg.windSpeedKMH = windSpeedKMH
        windSpeedImg.windSpeedMPH = windSpeedMPH
        arrowRot.angle = windDegree
        //arrowRot.angle = 90

    }

    function setSpeedUnits(unit) {
        windSpeedImg.speedUnits = unit
        if( unit == "km/h" ) {
            speed.text = windSpeedImg.windSpeedKMH + " " + windSpeedImg.speedUnits
        } else {
            speed.text = windSpeedImg.windSpeedMPH + " " + windSpeedImg.speedUnits
        }
    }
}
