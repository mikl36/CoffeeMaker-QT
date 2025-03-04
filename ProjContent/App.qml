// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls
import Harkkaproj
import "transitions"

Window {
    width: 700
    height: 800
    color: "grey"

    visible: true
    title: "Harkkaproj"

    // varaus objectille/oliolle, QT-integraatio (kahvi: tyyppi, valmistumisaika, maito, jne.)
    property string lastSelectedCoffee: ""

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: homeViewComponent // koti

        // yksinkertaiset transitiot stackissa, läpinäkyvyys, siirtyminen laidasta laitaan
        StackViewTransitions {
            id: transitions
        }

        pushEnter: transitions.pushEnter
        pushExit: transitions.pushExit
        popEnter: transitions.popEnter
        popExit: transitions.popExit

        // stackeilla rakennettu: home -> quickstart (nappi) ( vanha kahvivalinta -> brewing -> home) ||
        // start (nappi) <-> (home, nappi) coffeeselectview (start, nappi) -> brewing (valittu kahvi) -> home
        Component {
            id: homeViewComponent
            HomeView {
                onStartClicked: stackView.push(coffeeSelectViewComponent)
                onQuickStartClicked: {
                    let coffee = lastSelectedCoffee === "" ? "Blend" : lastSelectedCoffee; // Blend oletuksena
                    stackView.push(coffeeBrewingViewComponent, { "selectedCoffee": coffee });
                 //   stackView.push(coffeeBrewingViewComponent, { "selectedCoffee": "Latte" });
                }
            }
        }

        Component {
            id: coffeeSelectViewComponent
            CoffeeSelectView {
             //   onHomeClicked: stackView.pop(); // tämä on CoffeeSelectViewssä, vain muistutuksena
                onCoffeeBrewingStarted: function(coffeeType) { // kahvityypin perusteella
                    lastSelectedCoffee = coffeeType;
                    stackView.push(coffeeBrewingViewComponent, { "selectedCoffee": coffeeType });
                }
            }
        }

        Component {
            id: coffeeBrewingViewComponent
            CoffeeBrewingView {
                selectedCoffee: stackView.currentItem.property("selectedCoffee")
                onBrewingFinished: {
                    stackView.pop(); // poistaa coffeeBrewingView
                    stackView.pop(); // poistaa CoffeeSelectView
                    // stackView.replace(homeViewComponent);
                }
            }
        }
    }
}

