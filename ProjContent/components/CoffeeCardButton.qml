import QtQuick
import QtQuick.Controls

Rectangle {
    id: button // oma nappi CoffeeCardille

    property alias text: buttonText.text
    signal clicked // signaali painamisille

    width: 70
    height: 30
    radius: 5
    color: "tan"

    Text {
        id: buttonText
        anchors.centerIn: parent
        color: "seashell"
        font.pointSize: 10
    }

    MouseArea {
        id: buttonMouseArea
        anchors.fill: parent
        onClicked: button.clicked()
    }
}
