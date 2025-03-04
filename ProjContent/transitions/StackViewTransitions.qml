import QtQuick
import QtQuick.Controls

Item {
    id: transitions

    property alias pushEnter: pushEnterTransition
    property alias pushExit: pushExitTransition
    property alias popEnter: popEnterTransition
    property alias popExit: popExitTransition
    property int transitionDuration: 1000
    // tarvittaessa muut ominaisuudet, opacity

    Transition {
        id: pushEnterTransition
        NumberAnimation {
            property: "opacity";
            from: 0; to: 1;
            duration: transitionDuration
        }
        NumberAnimation {
            property: "x";
            from: transitions.parent.width; to: 0;
            duration: transitionDuration;
            easing.type: Easing.InOutQuad
        }
    }
    Transition {
        id: pushExitTransition
        NumberAnimation {
            property: "opacity";
            from: 1; to: 0;
            duration: transitionDuration
        }
        NumberAnimation {
            property: "x";
            from: 0; to: -transitions.parent.width;
            duration: transitionDuration;
            easing.type: Easing.InOutQuad
        }
    }
    Transition {
        id: popEnterTransition
        NumberAnimation {
            property: "opacity";
            from: 0; to: 1;
            duration: transitionDuration
        }
        NumberAnimation {
            property: "x";
            from: -transitions.parent.width; to: 0;
            duration: transitionDuration;
            easing.type: Easing.InOutQuad
        }
    }
    Transition {
        id: popExitTransition
        NumberAnimation {
            property: "opacity";
            from: 1; to: 0;
            duration: transitionDuration
        }
        NumberAnimation {
            property: "x";
            from: 0; to: transitions.parent.width;
            duration: transitionDuration;
            easing.type: Easing.InOutQuad
        }
    }
}
