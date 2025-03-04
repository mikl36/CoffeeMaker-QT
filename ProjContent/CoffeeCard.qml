import QtQuick
import QtQuick.Controls
import "components"

Rectangle {
    id: coffeeCard // kahvikorttipohja, jolla luodaan vaihtoehdot

    // pohja: kuva, otsikko (kahvityyppi), kuvaus, slider-arvot: maito, sokeri, vahvuus
    // onko kortti valittu (bool)
    property alias imageSource: coffeeImage.source
    property alias title: coffeeTitle.text
    property alias milkValue: milkSlider.value
    property alias strengthValue: strengthSlider.value
    property alias sugarValue: sugarSlider.value
    property alias description: coffeeDescription.text
    property bool isSelected: false

    property int userMilkValue: 0 // käyttäjän arvot
    property int userStrengthValue: 0
    property int userSugarValue: 0

    width: 600
    height: 200
    color: "darkslategray"
    radius: 10

    signal cardClicked // signaalit, kortti, start- ja home-napit
    signal startClicked
    signal homeClicked

    // rivi: oikealla column: kuva, title, vierekkäin (row, napit)
    // - vasemmalla aloitusnäkymä (kuvaus) tai sliderit (kortti valittu, column)
    Row {
        spacing: 40
        padding: 5
        anchors.centerIn: parent

        Column {
            spacing: 10

            Image {
                id: coffeeImage
                width: 150
                height: 100
                fillMode: Image.PreserveAspectFit
            }

            CustomText {
                id: coffeeTitle
                fontSize: 14
                wrapMode: Text.WordWrap
                width: 150
            }

            Row {
                spacing: 10
                CoffeeCardButton {
                    id: startButton
                    text: "Start"
                    visible: isSelected
                    onClicked: {
                        coffeeCard.startClicked()
                   //     coffeeCard.isSelected = false
                    }
                }

                CoffeeCardButton {
                    id: homeButton
                    text: "Home"
                    visible: isSelected
                    onClicked: {
                    //    console.log("Home button clicked");
                        coffeeCard.homeClicked()
                        coffeeCard.isSelected = false
                    }
                }
            }
        }

        CustomText {
            id: coffeeDescription
            fontSize: 12
            wrapMode: Text.WordWrap
            width: 150
            visible: !isSelected
        }

        Column {
            spacing: 10

            CoffeeSelectSlider {
                id: milkSlider
                label: "Milk"
                value: userMilkValue
                visible: isSelected
            }

            CoffeeSelectSlider {
                id: strengthSlider
                label: "Strength"
                value: userStrengthValue
                visible: isSelected
            }

            CoffeeSelectSlider {
                id: sugarSlider
                label: "Sugar"
                value: userSugarValue
                visible: isSelected
            }
        }
    }

    MouseArea { // kahvikortin valinta
        anchors.fill: parent
        enabled: !isSelected
        onClicked: {
          //  coffeeCard.isSelected = !coffeeCard.isSelected
            coffeeCard.cardClicked()
        }
    }

    // kasvatatetaan kortin koko valinnassa ja vaihdetaan väri, animaatio pehmentää
    states: [
        State {
            name: "default"
            when: !isSelected
            PropertyChanges { target: coffeeCard; width: 600; height: 200; color: "darkslategray" }
        },
        State {
            name: "selected"
            when: isSelected
            PropertyChanges { target: coffeeCard; width: 650; height: 250; color: "#4E2A2A" }
        }
    ]

    transitions: Transition {
        NumberAnimation { properties: "width,height"; duration: 300 }
        ColorAnimation { property: "color"; duration: 300 }
    }
}
