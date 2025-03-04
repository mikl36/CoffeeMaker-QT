import QtQuick
import QtQuick.Controls

SequentialAnimation {
    id: coffeeAnimation
    running: true
    loops: 1

    // propertyt ajoille, jos oikeasti kahvin / antureiden perusteella aika

    // yksinkertainen ja suoraviivainen animaatio perustuen läpinäkyvyyteen, yksi kierros
    // -> coffee-cup näkymä (mikä kahvi valittiin)
    // -> brewing näkymä (simuloisi valmitumisaikaa, tulisi kahviobjektilta, time)
    // -> valmistumisnäkymä (kahvin voi ottaa)
    PropertyAnimation {
        target: coffeecup
        property: "opacity"
        from: 1
        to: 0
        duration: 3000
    }

    PropertyAnimation {
        target: beginText
        property: "opacity"
        from: 1
        to: 0
        duration: 3000
    }

    ScriptAction {
        script: {
            coffeecup.visible = false;
            coffeeGif.visible = true;
            coffeeGif.playing = true;
        }
    }

    PropertyAnimation {
        target: coffeeGif
        property: "opacity"
        from: 0
        to: 1
        duration: 2000
    }

    PropertyAnimation {
        target: brewingText
        property: "opacity"
        from: 0
        to: 1
        duration: 1000
    }

    PauseAnimation {
        duration: 5000 // ajat riippuvaisia "oikeasti" kahvista
    }

    PropertyAnimation {
        target: brewingText
        property: "opacity"
        from: 1
        to: 0
        duration: 1000
    }

    ScriptAction {
        script: {
            coffeeGif.visible = false;
            coffeeGif.playing = false;
            finishedCup.visible = true;
        }
    }

    PropertyAnimation {
        target: finishedCup
        property: "opacity"
        from: 0.5
        to: 1
        duration: 3000
    }

    PropertyAnimation {
        target: enjoyText
        property: "opacity"
        from: 0
        to: 1
        duration: 1000
    }

    PauseAnimation {
        duration: 3000
    }

    PropertyAnimation {
        target: enjoyText
        property: "opacity"
        from: 1
        to: 0
        duration: 1000
    }

    ScriptAction {
        script: {
            brewingFinished(); // palataan kotinäkymään
        }
    }
}
