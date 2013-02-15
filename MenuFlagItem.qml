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
    property string itemImageSource

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

    Image {
        id: flagImage
        source: app.activeCountry
        width: 128
        height: 128
        x: gradient.width / 2 - width / 2

        function open() {
            if( app.state == "languageOpen") {
                app.state = "languageClosed";
            } else {
                app.state = "languageOpen";
            }
        }

        MouseArea {
            id: mouseRegion
            anchors.fill: flagImage
            //onPressed: gradient.state = "Pressed"
            onReleased: { flagImage.open(); }
        }
    }
/*
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
            PropertyAnimation { properties: "x"; easing.type: Easing.InOutQuad }

        },
        Transition {
            from: "languageClosed"
            to: "languageOpen"
            PropertyAnimation { properties: "x"; easing.type: Easing.InOutQuad }
        }
    ] */
}

