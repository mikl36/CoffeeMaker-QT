import QtQuick
import QtQuick.Controls

Text {
    id: textItem
    // yleistekstipohja

    property string customText: ""
    property int fontSize: 18 // oletusarvot
    property real pixelSize: -1
    property color textColor: "seashell"
    property int horizontalAlign: Text.AlignHCenter
    property int verticalAlign: Text.AlignVCenter
    property real textOpacity: 1.0

    text: customText
    font.pointSize: pixelSize < 0 ? fontSize : 0 // ehdollinen pointsize
    font.pixelSize: pixelSize >= 0 ? pixelSize : 0 // tai pixelsize
    color: textColor
    horizontalAlignment: horizontalAlign
    verticalAlignment: verticalAlign
    opacity: textOpacity
}
