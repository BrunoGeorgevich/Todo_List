import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {

    property string mainRectColor
    property string cardTitle: "No Title"
    property string cardDescription: "No Description"

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
            id:title
            text:cardTitle

            color: "#555"

            font {
                bold: true
                pixelSize: parent.height/5
            }

            anchors{
                top: parent.top
                left: parent.left
                topMargin: parent.height*(0.1)
                leftMargin: parent.width*(0.05)
            }
        }

        Text {
            id:description
            text:cardDescription

            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                topMargin: parent.height*(0.4)
                leftMargin: parent.width*(0.1)
                rightMargin: parent.width*(0.03)
            }

            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

            color: "#888"

            font {
                bold: true
                pixelSize: parent.height/8
            }

            onTextChanged: {
                description.text = description.text.substring(0,140)
            }
        }
    }
}

