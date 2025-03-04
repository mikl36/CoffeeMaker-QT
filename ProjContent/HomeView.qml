import QtQuick
import QtQuick.Controls
import "components"

Rectangle {
    width: 700
    height: 800

    signal startClicked() // signaalit, kahvin valintanäkymään
    signal quickStartClicked() // suoraan valmistukseen, brewing

    Image { // kotinäkymän taustakuva
        source: "images/kahvitausta.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    property int water_temperature: 94 // veden lämpötilan valinta
    property int water_max_temp: 97
    property int water_min_temp: 88


    // column (Pääteksti - valintanapit (row, vierekkäin) -
    // column : veden valinta & säätönapit (row, vierekkäin))
    Column {
        anchors.centerIn: parent
        spacing: 20

        CustomText {
            id: titleText
            customText: "Let's make some coffee"
            fontSize: 24
        }

        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            HomeButton {
                text: "Quick Start"
                onButtonClicked: quickStartClicked()
            }

            HomeButton {
                text: "Start"
                onButtonClicked: startClicked()
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            CustomText {
                id: waterSelectText
                customText: "Select Water Temperature"
                fontSize: 10
            }

            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                HomeButton {
                    text: "-" // napeilla lämpötilan säätö
                    onButtonClicked: {
                        if (water_temperature > water_min_temp) {
                            water_temperature -= 1
                        }
                    }
                }

                CustomText {
                    id: temperatureText
                    customText: water_temperature + " °C"
                    fontSize: 18
                }

                HomeButton {
                    text: "+"
                    onButtonClicked: {
                        if (water_temperature < water_max_temp) { // maksimiarvo
                            water_temperature += 1
                        }
                    }
                }
            }
        }
    }
}
