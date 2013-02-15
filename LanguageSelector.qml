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
    id: languageSelector
    width: 1280
    height: 800
    x: 1280 * 2

    Image {
        source: "images/Background.png"
        asynchronous: true
        cache: true
        //anchors.top: parent.top
    }

    function show() {
        opacity = 0
    }

    function hide() {
        opacity = 0;
    }

    Component {
        id: countryDelegate
        Item {
            id: countryItem
            width: 256; height: 300
            Column {
                Image {
                    width: 256
                    height: 256
                    source: flag
                }
                Text {
                    id: countryName
                    width: 256
                    text: country
                    font.family: "Stone Sans Sem ITC TT"
                    font.pointSize: 30
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            MouseArea {
                id: mouseRegion
                anchors.fill: countryItem
                //onClicked: { countryDelegate.clicked(); }
                //onPressed: gradient.state = "Pressed"
                onReleased: { countryItem.select(); }
            }

            function select() {
                app.activeCountry = flag
                app.countryCode = code
                app.state = "languageClosed"

                switch( code ) {
                case "gr":
                case "cy":
                    app.lang = {
                        'Humidity': "Υγρασία",
                        'Visibility': "Ορατότητα",
                        'Precipitation': "Κατακρήμνιση",
                        'Cloud Cover': "Νεφοκάλυψη",
                        'Weather Station': "Οικ. Σταθμός",
                        '5 Day Forecast': "Πρόγνωση 5 ημερών",
                        'Menu': "Ρυθμίσεις",
                        'Language': "Γλώσσα",
                        'Units': "Μονάδες",
                        'Location': "Τοποθεσία",
                        'Set': "OK",
                        'at': "στις",
                        '395': "Μέτρια ή έντονη χιονόπτωση με αστραπές",
                        '392': "Κατά τόπους χιονόπτωση με αστραπές",
                        '389': "Μέτρια ή δυνατή βροχή με αστραπές",
                        '386': "Κατά τόπους βροχή φως με αστραπές",
                        '377': "Μέτρια ή βαριά πτώση σβόλων πάγου",
                        '374': "Πτώση σβόλων πάγου",
                        '371': "Μέτρια ή βαριά χιονόπτωση",
                        '368': "Χιονόπτωση",
                        '365': "Χιονόνερο",
                        '362': "Χιονόνερο",
                        '359': "Καταρρακτώδης ψιλή βροχή",
                        '356': "Μέτρια ή βαριά ψιλή βροχής",
                        '353': "Ψιλής βροχής",
                        '350': "Χαλάζι",
                        '338': "Βαρύ χιόνι",
                        '335': "Κατά τόπους ισχυρές χιονοπτώσεις",
                        '332': "Μέτρια χιονόπτωση",
                        '329': "Κατά τόπους μέτρια χιονόπτωση",
                        '326': "Χιονόπτωση",
                        '323': "Κατά τόπους νεφελώδης",
                        '320': "Χιονόνερο",
                        '317': "Χιονόνερο",
                        '314': "Μέτρια ή βαριά παγωμένη βροχή",
                        '311': "Παγωμένη βροχή ",
                        '308': "Δυνατή βροχή",
                        '305': "Δυνατή βροχή κατά τόπους",
                        '302': "Μέτρια βροχή",
                        '299': "Μέτρια βροχή κατά τόπους",
                        '296': "Βροχή",
                        '293': "Κατά τόπους βροχή",
                        '284': "Χιονόνερο",
                        '281': "Χιονόνερο",
                        '266': "Ψιλόβροχο",
                        '263': "Κατά τόπους ελαφριά βροχή",
                        '260': "Ομίχλη",
                        '248': "Ομίχλη",
                        '230': "Καταιγίδα",
                        '227': "Χιονόπτωση",
                        '200': "Καταιγίδα",
                        '185': "Ψιχαλίζει",
                        '182': "Χιονόνερο",
                        '179': "Χιόνι",
                        '176': "Σποραδική βροχή",
                        '143': "Ομίχλη",
                        '122': "Συννεφιά",
                        '119': "Συννεφιά",
                        '116': "Βροχή",
                        '113': "Λιακάδα",
                        'MON': "Δευτερα",
                        'TUE': "Τριτη",
                        'THU': "Τεταρτη",
                        'WED': "Πεμπτη",
                        'FRI': "Παρασκευη",
                        'SAT': "Σαββατο",
                        'SUN': "Κυριακη"

                    }
                    break;
                case "us":
                    app.lang = {
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
                    break;

                }
                app.loadCity(app.activeCity)
            }
        }
    }

    ListView {
         id: list
         width: 1280
         height: 800
         y: height / 2 - 150
         model: CountriesModel {}
         delegate: countryDelegate

         highlight: highlight
         highlightFollowsCurrentItem: false
         focus: true
         orientation: ListView.Horizontal
     }
}
