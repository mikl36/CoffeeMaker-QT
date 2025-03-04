import QtQuick
import QtQuick.Controls
import "components"

Rectangle {
        width: 700
        height: 800
        id: coffeebrewing

        signal brewingFinished() // palataan kotinäkymään

        property bool isBrewing: false // c++ integraatio?
        property string selectedCoffee: ""
        // käytetään kahvityyppien aikoja animaation aikataulutukseen
        property int brewingTimeInSecs: 100 // omat jokaiselle kahville, latte_time, basic_time

        // alkunäkymän kuva (mikä kahvi valmistuu)
        Image {
            id: coffeecup
            source: "images/kuppitausta.jpg"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
        }

        // loppunäkymän kuva (kahvin voi ottaa)
        Image {
            id: finishedCup
            source: "images/kuppitausta2.jpg"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            visible: false
        }

        // välinäkymä, gif (odotetaan valmistumista brewingTimeInSecs:n perusteella)
        AnimatedImage {
            id: coffeeGif
            source: "images/roast.gif"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            visible: false
            playing: false
        }

        // alkuteksti, arvoitu valmistusmisaika
        CustomText {
            id: beginText
            customText: "Be ready in " + brewingTimeInSecs + " seconds..."
            anchors.centerIn: parent
            pixelSize: 35
            color: "saddlebrown"
            wrapMode: Text.WordWrap
        }

        // teksti, joka ilmoittaa valmistumisen alkaneen
        CustomText {
            id: brewingText
            customText: "Coffee is brewing"
            anchors.centerIn: parent
            font.pixelSize: 40
            opacity: 0
        }

        // valmistumisteksti
        CustomText {
            id: enjoyText
            customText: "Coffee is ready, enjoy"
            anchors.centerIn: parent
            pixelSize: 40
            opacity: 0
        }

        Component.onCompleted: { // synkronisointi, kahvi valittu
            // console.log("Brewing: " + selectedCoffee);
            brewingText.text = "Brewing " + selectedCoffee + "...";
        }
        /* // timeri, jos säästäisi resursseja
        Timer {
            id: brewingTimer
            interval: 5000 // 1 minuutti
            repeat: true
            running: false
            onTriggered: {
                coffeeGif.playing = !coffeeGif.playing;
            }
        }
        */ // script: brewingTimer.start(); stop()

        CoffeeBrewingAnimation { // animaatio kahvin valmistuksen ajaksi
               id: coffeeAnimation
           }
}
