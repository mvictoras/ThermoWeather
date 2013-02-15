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
    id: gradient
    source: "images/HeaderGradient.png"
    width: 200
    height: 34
    x: -30
    state: "Closed"

    signal clicked

    //property Item parent: gradient.parent

    Image {
        id: arrowButton
        source: "images/Arrow.png"
        width: 30
        height: 34

        transform: Rotation {
            id: arrowRot
            origin.x: arrowButton.width / 2;
            origin.y: arrowButton.height / 2;
            //axis.x:0; axis.y:1; axis.z:0
            angle: 180

            //Behavior on angle { PropertyAnimation{} }
        }
    }

    Text {
        id: headerText
        text: app.lang['Menu']
        font.family: "Trajan Pro"
        font.pointSize: 16
        font.bold: true
        anchors.left: gradient.left
        anchors.verticalCenter: gradient.verticalCenter
        anchors.leftMargin: 40
        color: "white"
    }

    function toggle() {
        if( gradient.state == "Open") {
            gradient.state = "Closed";
            arrowRot.angle = 180;
        } else {
            gradient.state = "Open";
            arrowRot.angle = 0;
        }
    }

    MouseArea {
        id: mouseRegion
        anchors.fill: arrowButton
        onClicked: { gradient.clicked(); }
        //onPressed: gradient.state = "Pressed"
        onReleased: { gradient.toggle(); }
    }

    states: [
        State {
            name: "Open"
            //PropertyChanges { target: gradient; x: -30}
            //PropertyChanges { target: gradient.parent.parent.Forecast.forecast.width; x: 200}
            PropertyChanges { target: forecast; width: 519 }
            PropertyChanges { target: currentWeather; width: 558 }
            PropertyChanges { target: gradient; x: -30}
            PropertyChanges { target: menuFlagItem; x: 20}
            PropertyChanges { target: menuLocationItem; x: 20}
            PropertyChanges { target: menuUnitsItem; x: 20}
        },
        State {
            name: "Closed"
            //PropertyChanges { target: gradient; x: 100}
            //PropertyChanges { target: gradient.parent.parent.Forecast.forecast.width; x: 519}
            PropertyChanges { target: forecast; width: 554 }
            //PropertyChanges { target: day; width: 650 }
            PropertyChanges { target: currentWeather; width: 620 }
            PropertyChanges { target: gradient; x: 0}
            PropertyChanges { target: menuFlagItem; x: 80}
            PropertyChanges { target: menuLocationItem; x: 80}
            PropertyChanges { target: menuUnitsItem; x: 80}
        }
    ]

    transitions: [
        Transition {
            from: "Open"
            to: "Closed"
            PropertyAnimation { properties: "x, width"; easing.type: Easing.InOutQuad }

        },
        Transition {
            from: "Closed"
            to: "Open"
            PropertyAnimation { properties: "x, width"; easing.type: Easing.InOutQuad }
        }
    ]
}
