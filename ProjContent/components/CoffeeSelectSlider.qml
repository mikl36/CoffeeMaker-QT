import QtQuick
import QtQuick.Controls

Rectangle {
    id: coffeeSelectSlider
    // slideri kahvivalikolle

    property alias label: label.text // kuvaus
    property alias value: slider.value // numeroarvo

    property int minValue: 0 // hieman säätövaraa
    property int maxValue: 5
    property int userValue: 0 // mahdollisuus tallentaa käyttäjän arvot

    width: 350
    height: 50
    color: "tan"
    radius: 10

    Row {
        spacing: 10
        padding: 5
        anchors.centerIn: parent

        Text {
            id: label
            text: "Property"
            font.pointSize: 14
            color: "seashell"
        }

        Slider {
            id: slider
            from: minValue
            to: maxValue
            stepSize: 1
            value: userValue
            width: 200
            onValueChanged: coffeeSelectSlider.value = value // vanha arvo tallentuu
        }

        Text {
            text: slider.value
            font.pointSize: 14
            color: "seashell"
        }
    }
}
