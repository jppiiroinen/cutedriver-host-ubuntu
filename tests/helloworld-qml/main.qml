import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    objectName: "MainWindow"
    visible: true
    width: 360
    height: 360

    Column {
        spacing: 5
        anchors.margins: 20
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        Label {
            id: label
            objectName: "label"
            text: "label"
        }

        Button {
            anchors {
                left: parent.left
                right: parent.right
            }

            objectName: "pushButton"
            text: "Hello World"
            onClicked: {
                label.text = "Clicked"
            }
        }
    }
}
