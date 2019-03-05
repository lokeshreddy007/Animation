import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Window 2.2

Window {
    id:root
    visible: true
    width: 1000
    height: 800
    color: "#3A4055"
    title: qsTr("Hello World")

    Rectangle {
        color: "#3A4055"
        id:inputrect
        width:800
        height:150

        Row {
            id:inputrow
            spacing: 10
            Text {
                id: textinfo
                text: qsTr("Number of Cricle:")
                font.pointSize: 20
                color: "red"
            }
            Rectangle {
                id:cirwrite
                width: 75;
                height: 50
                TextInput {
                    id:circleinfo
                    width: cirwrite.width
                    height: cirwrite.height
                    padding: 2
                    text:"1"
                    font.pointSize: 20
                    color: "red"
                }
            }
            Text {
                id: xtextinfo
                text: qsTr("x position:")
                font.pointSize: 20
                color: "red"
            }
            Rectangle {
                id:xval
                width: 75;
                height: 50
                TextInput {
                    id:xtext
                    width: cirwrite.width
                    height: cirwrite.height
                    padding: 2
                    text:""
                    font.pointSize: 20
                    color: "red"
                }
            }
            Text {
                id: ytextinfo
                text: qsTr("y position:")
                font.pointSize: 20
                color: "red"
            }
            Rectangle {
                id:yval
                width: 75;
                height: 50
                TextInput {
                    id:ytext
                    width: cirwrite.width
                    height: cirwrite.height
                    padding: 2
                    text:""
                    font.pointSize: 20
                    color: "red"
                }
            }
            Button {
                id:animationStart
                x:350;y:15
                text: "Animate"
                onClicked: {
                    rep.model = circleinfo.text
                }
            }
            Button {
                id:animationStop
                x:450;y:15
                text: "Stop"
                onClicked: {
                    animationWork.animations.paused
                }
            }
        }
        Item {
            id: displayCiricle
            x:25;y:55
            Column {
                spacing: 10
                Repeater {
                    id:rep
                    Rectangle {
                        id:rect1
                        x: xtext.text
                        y: ytext.text
                        width:150;height:150
                        border.color:"red"
                        radius : width * 0.5
                        color:"red"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: { rect1.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1); }
                        }
                        SequentialAnimation on x  {
                            id:animationWork
                            loops: Animation.Infinite
                            PropertyAnimation { to: 700;easing.type:Easing.InOutQuart  }
                            PauseAnimation { duration: 400 }
                            PropertyAnimation { to: 0;easing.type:Easing.InOutQuart}
                            PauseAnimation { duration: 400 }
                        }
                    }
                }
            }
        }
    }
}
