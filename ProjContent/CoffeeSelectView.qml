import QtQuick
import QtQuick.Controls
import "components"

Rectangle {
    width: 700
    height: 800
    color: "dimgray"

    signal homeClicked() // kotinäkymään paluu
    signal coffeeBrewingStarted(string coffeeType) // brewing, säilytetään valittu kahvi (varaus, objekti)

   // property string selectedCoffee: ""
    property var selectedCoffee: [] // säilytetään kahvien indeksit

    gradient: Gradient {
        GradientStop { position: 0.00; color: "#696969" }
        GradientStop { position: 0.48; color: "#d2b48c" }
        GradientStop { position: 1.00; color: "#696969" }
    }

    Rectangle { // tausta muuttuu, kun kortti on valittu, ei paluuta
        id: overlay
        anchors.fill: parent
        color: "black"
        opacity: 0.5
        visible: false
    }

    // käytetään ListModelia ja -elementtejä,
    // niin hieman dynaamisempi ja muutosvalmiimpi rakenne (alla vanha ratkaisu)
    ListModel {
        id: coffeeModel
        ListElement {
            imageSource: "images/bean.jpg";
            title: "Blend";
            description: "A strong, rich coffee made from freshly ground coffee beans";
            isSelected: false
        }
        ListElement {
            imageSource: "images/latte.jpg";
            title: "Latte";
            description: "A creamy coffee drink made with espresso and steamed milk";
            isSelected: false
        }
        ListElement {
            imageSource: "images/cappuccino.jpg";
            title: "Cappuccino";
            description: "A coffee made with espresso, milk and steamed milk foam";
            isSelected: false
        }
    }

    ListView {
        id: coffeeListView
        anchors.fill: parent
        topMargin: 55
        spacing: 15
        model: coffeeModel
        clip: true

        // rakennetaan kahvitiedot (ListView) CoffeeCardilla,
        // coffee: image, title, description, isSelected (card)
        delegate: CoffeeCard {
            id: coffeeCard
            imageSource: model.imageSource
            title: model.title
            description: model.description
            isSelected: model.isSelected
            anchors.horizontalCenter: parent.horizontalCenter
            onCardClicked: { // kortin valintatoiminnot
                // puhdistetaan/poistetaan aiemmat valinnat (ei voi olla useampia valittuna)
                for (let i = 0; i < coffeeModel.count; i++) {
                    coffeeModel.set(i, { isSelected: false });
                }
                coffeeModel.set(index, { isSelected: true }); // valitaan nykyinen (klikkaus)
                overlay.visible = true; // tausta muuttuu
                selectedCoffee = [index]; // säilytetään valittu indeksi
              //  console.log(model.title + " selected");
            }
            onStartClicked: { // brewing aloitus
                            if (model.isSelected) { // tarkistetaan, että on valittu
                                coffeeBrewingStarted(model.title); // kahvi valmistukseen kahvityypillä
                                coffeeModel.set(index, { isSelected: false }); // vanhojen tyhjennykset
                                selectedCoffee = [];
                                overlay.visible = false;
                            }
                        }
            onHomeClicked: {
                stackView.pop(); // palataan kotisivulle
            }
        }
    }
}

// vanha toteutus (jäykkä)
/*
Rectangle {
    width: 700
    height: 800
    color: "dimgray"

    signal homeClicked()
    signal coffeeBrewingStarted(string coffeeType)

    property string selectedCoffee: ""

    gradient: Gradient {
        GradientStop {
            position: 0.00
            color: "#696969"
        }
        GradientStop {
            position: 0.48
            color: "#d2b48c"
        }
        GradientStop {
            position: 1.00
            color: "#696969"
        }
    }

    Rectangle {
        id: overlay
        anchors.fill: parent
        color: "black"
        opacity: 0.5
        visible: false
    }

    Column {
        spacing: 15
        anchors.centerIn: parent

        CoffeeCard {
            id: blackCoffeeCard
            imageSource: "bean.jpg"
            title: "Bean"
            description: "A strong, rich coffee made from freshly ground coffee beans"
            onCardClicked: {
                blackCoffeeCard.isSelected = true
                latteCoffeeCard.isSelected = false
                cappuccinoCoffeeCard.isSelected = false
                overlay.visible = true
                console.log("Bean selected")
                selectedCoffee = "Bean";
            }
        }

        CoffeeCard {
            id: latteCoffeeCard
            imageSource: "latte.jpg"
            title: "Latte"
            description: "A creamy coffee drink made with espresso and steamed milk"
            onCardClicked: {
                blackCoffeeCard.isSelected = false
                latteCoffeeCard.isSelected = true
                cappuccinoCoffeeCard.isSelected = false
                overlay.visible = true
                console.log("Latte selected")
                selectedCoffee = "Latte";
            }
        }

        CoffeeCard {
            id: cappuccinoCoffeeCard
            imageSource: "cappuccino.jpg"
            title: "Cappuccino"
            description: "A coffee made with espresso, milk and steamed milk foam"
            onCardClicked: {
                blackCoffeeCard.isSelected = false
                latteCoffeeCard.isSelected = false
                cappuccinoCoffeeCard.isSelected = true
                overlay.visible = true
                console.log("Cappuccino selected")
                selectedCoffee = "Cappuccino";
            }
        }
    }

    Connections {
            target: blackCoffeeCard
            onHomeClicked: homeClicked()
            onStartClicked: {
                if (selectedCoffee === "Bean") { // oikean kahvityypin tarkistus
                    coffeeBrewingStarted(selectedCoffee); // signaalin lähetys
                    selectedCoffee = ""; // Reset
                    blackCoffeeCard.isSelected = false;
                    overlay.visible = false;
                }
            }
        }

        Connections {
            target: latteCoffeeCard
            onHomeClicked: homeClicked()
            onStartClicked: {
                if (selectedCoffee === "Latte") {
                    coffeeBrewingStarted(selectedCoffee);
                    selectedCoffee = "";
                    latteCoffeeCard.isSelected = false;
                    overlay.visible = false;
                }
            }
        }
        Connections {
            target: cappuccinoCoffeeCard
            onHomeClicked: homeClicked()
            onStartClicked: {
                if (selectedCoffee === "Cappuccino") {
                    coffeeBrewingStarted(selectedCoffee);
                    selectedCoffee = "";
                    cappuccinoCoffeeCard.isSelected = false;
                    overlay.visible = false;
                }
            }
        }
} */
