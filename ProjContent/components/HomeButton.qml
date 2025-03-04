import QtQuick
import QtQuick.Controls

Button {
    id: homeButton

    // custom nappi HomeViewille, varalta joitakin mahd. muutosvaihtoehtoja
    property color buttonColor: "sienna"
    property color textColor: "seashell"
    property int pointSize: 10

    signal buttonClicked // signaali klikkaukselle

    background: Rectangle {
        color: homeButton.buttonColor
        radius: 10
        border.color: "transparent"
        border.width: 2
    }

    contentItem: Text {
        text: homeButton.text
        color: homeButton.textColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Roboto"
        font.pointSize: homeButton.pointSize
    }

    onClicked: {
        homeButton.buttonClicked()
        borderAnimation.start()
    }

    // napille animaatio, joka korostuu ulkoreunat valkoiseksi hetkellisesti
    SequentialAnimation {
        id: borderAnimation
        loops: 1

        PropertyAnimation {
            target: background
            property: "border.color"
            from: "transparent"
            to: "white"
            duration: 150
        }

        PauseAnimation {
            duration: 200
        }

        PropertyAnimation {
            target: background
            property: "border.color"
            from: "white"
            to: "transparent"
            duration: 150
        }
    }
}
