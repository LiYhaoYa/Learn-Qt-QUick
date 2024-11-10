import QtQuick

Item {
    width: 800
    height:  width * (2/3)

    Rectangle {
        id: rect1
        x: 12; y: 12
        width: 76; height: 96
        color: "lightsteelblue"
    }

    Rectangle {
        id: rect2
        x: 112; y: 12
        width: 76; height: 96
        border.color: "lightsteelblue"
        border.width: 4
        radius: 8
    }

    Rectangle {
        id: rect3
        x: 212; y: 12
        width: 176; height: 96
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "slategray" }
        }
        border.color: "slategray"
    }

    Text {
        id: text
        x: 12; y: 112
        text: "The quick brown fox"
        color: "#303030"
        font.family: "Ubuntu"
        font.pixelSize: 28
    }

    Text {
        id: text2
        x: 312; y: 112
        width: 190; height: 120
        text: 'A very long text'
        // '...' 应出现在中间
        elide: Text.ElideMiddle
        // 红色凹陷文字造型
        style: Text.Sunken
        styleColor: '#FF4444'
        // 将文本对齐到顶部
        verticalAlignment: Text.AlignTop
        // 仅在没有省略模式时才有意义
        // wrapMode: Text.WordWrap
    }

    Image {
        x: 12; y: 212
        // width: 72
        // height: 72
        source: "../images/triangle_red.png"
    }
    Image {
        x: 150; y: 312
        // width: 72
        height: 72/2
        source: "../images/triangle_red.png"
        fillMode: Image.PreserveAspectCrop
        // clip: true
    }

    Rectangle {
        id: rect4
        x: 412; y: 12
        width: 76; height: 96
        color: "lightsteelblue"

        MouseArea {
            id: area
            width: parent.width
            height: parent.height
            onClicked: rect5.visible = !rect5.visible
        }
    }

    Rectangle {
        id: rect5
        x: 512; y: 12
        width: 76; height: 96
        border.color: "lightsteelblue"
        border.width: 4
        radius: 8
    }
}
