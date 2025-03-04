import QtQuick
import QtQuick.Controls

Rectangle {
    width: 360
    height: 640
    color: "tan"
    id: waterselect

    ListModel {
        id: dropModel
    }

    Canvas {
            id: dropCanvas
            anchors.fill: parent
            onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        for (var i = 0; i < dropModel.count; i++) {
                            var drop = dropModel.get(i)
                            // drop body
                            ctx.beginPath()
                            ctx.arc(drop.x, drop.y, 15, 0, Math.PI * 2)
                            ctx.fillStyle = "lightseagreen"
                            ctx.fill()
                            // triangle tail
                            ctx.beginPath()
                            ctx.moveTo(drop.x, drop.y - 40)
                            ctx.lineTo(drop.x - 10, drop.y - 11)
                            ctx.lineTo(drop.x + 10, drop.y - 11)
                            ctx.closePath()
                            ctx.fillStyle = "lightseagreen"
                            ctx.fill()
                        }
                    }
                }

    Timer {
        interval: 18
        running: true
        repeat: true
        onTriggered: {
            for (var i = 0; i < dropModel.count; i++) {
                var drop = dropModel.get(i)
                var newY = drop.y + drop.vy
                if (newY > dropCanvas.height) {
                    dropModel.remove(i)
                    i--
                } else {
                    dropModel.setProperty(i, "y", newY)
                }
            }
            dropCanvas.requestPaint()
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: (mouse) => {
            dropModel.append({
                x: mouse.x,
                y: mouse.y,
                vy: 5
            })
        }
    }
}
