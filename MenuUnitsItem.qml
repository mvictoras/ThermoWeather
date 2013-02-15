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

    property string itemHeader

    spacing: 20

    Image {
        id: gradient
        source: "images/gradient.png"
        width: 200
        height: 34
        x: 20

        Text {
            text: itemHeader
            font.family: "Trajan Pro"
            font.pointSize: 16
            font.bold: true
            anchors.left: gradient.left
            anchors.verticalCenter: gradient.verticalCenter
            anchors.leftMargin: 10
            color: "white"
        }
    }

    Text {
        id: degrees
        text: "C°"
        width: gradient.width
        font.family: "Stone Sans Sem ITC TT"
        font.pointSize: 36
        horizontalAlignment: Text.AlignHCenter
        color: "black"
        //anchors.top: gradient.bottom

        MouseArea {
            id: mouseRegionDegrees
            anchors.fill: degrees
            onReleased: { degrees.toggle(); }
        }

        function toggle() {
            if( degrees.text === "F°") {
                degrees.text = "C°"
                mainContainer.setDegreeUnits("C")
            } else {
                degrees.text = "F°"
                mainContainer.setDegreeUnits("F")
            }
        }

    }

    Text {
        id: speed
        text: "km/h"
        width: gradient.width
        font.family: "Stone Sans Sem ITC TT"
        font.pointSize: 36
        horizontalAlignment: Text.AlignHCenter
        color: "black"
        //anchors.top: gradient.bottom

        state: "km/h"

        MouseArea {
            id: mouseRegionSpeed
            anchors.fill: speed
            onReleased: { speed.toggle(); }
        }

        function toggle() {
            if( speed.text == "km/h" ) {
                speed.text = "mph"
            } else {
                speed.text = "km/h"
            }
            mainContainer.setSpeedUnits(speed.text)
        }

    }
}

