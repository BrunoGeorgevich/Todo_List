import QtQuick 2.4
import QtQuick.Controls 1.3

import "qrc:/components"

ApplicationWindow {
    id:root
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    TopBar {
        id:topBar
        z:1

        anchors {
            fill: parent
            bottomMargin: parent.height*(0.9)
        }

        mainRectColor: "#4CAF50"
        textTopBar: "Tasks"
    }

    Flickable {

        anchors.top: topBar.bottom
        anchors.topMargin: parent.height*(0.05)
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width*(0.05)
        anchors.right: parent.right
        anchors.rightMargin: parent.width*(0.05)

        contentHeight: taskIterator.count * (root.height*(0.2) + taskColumn.spacing)

        Column {
            id:taskColumn
            spacing: 20

            Repeater {
                id:taskIterator
                model: ListModel { id:cards }
                delegate: Card{

                    cardTitle: title
                    cardDescription: description

                    width:root.width*(0.9)
                    height: root.height*(0.2)
                    mainRectColor: "white"

                }
            }
        }
    }

    FloatActionButton {
        raio:70
        icon:"qrc:/assets/plus.png"
        mainRectColor: "#536DFE"
        anchors {
            bottom: parent.bottom
            right: parent.right
            bottomMargin: parent.height*(0.05)
            rightMargin: parent.width*(0.05)
        }
    }

    Dialog {
        id:createTaskDialog
    }

    Component.onCompleted: initialize();

    //JS Functions
    function initialize() {
        cards.append({
                         title:"Study",
                         description:"Study QML!"
                     });
        cards.append({
                         title:"Work",
                         description:"Focus on web development and c++"
                     });
    }

    function addCard(t, d) {
        cards.append({
                         title:t,
                         description:d
                     });
    }
}
