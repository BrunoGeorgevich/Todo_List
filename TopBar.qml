import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {

    property string mainRectColor
    property string textTopBar : "No Text"

    DropShadow {
        anchors.fill: mainRect
        source:mainRect
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 16
        color: "#80000000"
        transparentBorder: true
    }

    Rectangle {
        id:mainRect
        color: mainRectColor
        anchors.fill: parent

        Text {
            anchors.centerIn: parent

            color:"white"

            font {
                bold:true
                pixelSize: parent.height/1.3
            }

            text:textTopBar
        }
    }
}

