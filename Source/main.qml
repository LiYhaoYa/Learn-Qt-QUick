//main.qml
//所有的 QML 文件都将带有后缀.qml

import QtQuick  //大多数标准类型位于QtQuick模块中，可通过文件开头的 import 语句获得.qml

//QML 需要有且只有一个根类型 并且不限制根类型的选择

/*
 *每种类型都有属性。例如，图像具有属性width和height，每个属性都包含像素数。它还具有其他属性，
 *例如source。由于图像类型的大小是从图像大小自动派生而来的，因此我们不需要自己设置width和height属性。*/

Image {

    id: image       /* id： 一个特殊的可选属性，它包含一个标识符，可用于在文档的其他地方引用其关联类型
                     *属性id一旦设置就无法更改，也不能在运行时设置*/

    source: "../images/background.png"


    Image {
        id: pole
        source: "../images/pole.png"

        anchors.horizontalCenter: parent.horizontalCenter   //将棍子置于背景中间靠下放置
        anchors.bottom: parent.bottom
    }

    Image {
        id: wheel
        source: "../images/pinwheel.png"

         /*为了将风车放在中间，我们使用了一个名为 anchor 的复杂属性。锚定允许您指定父对象和同级对象之间的几何关系
          *两端分别有left、right、top、bottom、centerIn、fill、verticalCenter、horizo​​ntalCenter关系。*/
        anchors.centerIn: parent                    //将风车至于中心位置

        /*Behavior 为定义的属性指定一个动画，用于对该属性应用的每个更改。
         *换句话说，只要属性发生变化，就会运行动画。这只是在 QML 中制作动画的众多方法之一。*/
        Behavior on rotation {
            NumberAnimation {   //每当车轮的旋转属性发生变化时，它都会使用NumberAnimation 持续时间为 250 毫秒的动画
                duration: 250
            }
        }
    }

    /* 当用户在场景中的某个地方按下鼠标时，风车就会旋转 */
    MouseArea {
        anchors.fill: parent                //覆盖整个窗口区域

        /*当用户点击鼠标区域覆盖的区域时，鼠标区域会发出信号。您可以通过重写onClicked函数来连接到此信号。
         *当连接信号时，意味着每当发出信号时都会调用它对应的函数（或多个函数）。
         *在这种情况下，我们说当鼠标区域内有鼠标点击时，其类型id（wheel即风车）应旋转 +90 度。*/
        onClicked: wheel.rotation += 90
        /*此技术适用于所有信号，
         *其命名约定为 on + SignalName（标题大小写）。
         *此外，所有属性在其值发生变化时都会发出信号。
         *对于这些信号，命名约定为：' on${property}Changed '
         *例如，如果某个width属性发生了变化，您可以使用 来观察它 onWidthChanged: print(width)。*/
    }
}

/*
 *将图像作为根类型（Image）的子类型说明了声明性语言的一个重要概念。
 *您可以按照图层和分组的顺序描述用户界面的视觉外观。
 *其中最底层（background.png image）首先绘制，然后在包含类型的本地坐标系中在其上方绘制子图层。*/
