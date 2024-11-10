
import QtQuick      //import 语句导入一个模块。可以添加可选版本，格式为 <major>.<minor>。


/* 每一个QML文件都要有一个根元素 */
/* 每一个元素通过其类型声明，后跟 { } */
/* 每一个元素都可以可以具有属性，其形式为 name: value */

Rectangle {     /* 此文件的根元素为一个 Rectangle */
    id: root    /* 每一个元素都拥有 id（不带引号的标识符），在此 QML 文档中的任意元素都可以访问此 id */

    width: 120; height: 240

    color: "#4A4A4A"

    /* 元素可以嵌套，这意味着父元素可以有子元素。子元素可以使用 parent 关键字访问父元素 */
    Image {
        id: triangle

        x: (parent.width - width)/2; y: 40

        source: '../images/triangle_red.png'
    }

    Text {
        y: triangle.y + triangle.height + 20

        width: root.width

        color: 'white'
        horizontalAlignment: Text.AlignHCenter
        text: 'Triangle'
    }


    // Text {
    //     /* (1) 标识符  id 是一个非常特殊的属性类值，它用于引用 QML 文件（在 QML 中称为“document”）内的元素。
    //      * id 不是字符串类型，而是一个标识符，是 QML 语法的一部分。id 在文档中必须是唯一的，并且不能重置为其他值，也不能查询。
    //      *（它的行为很像 C++ 世界中的引用。） */
    //     id: thisLabel

    //     /* (2) 设置 x 和 y 的位置。可以根据属性的类型为其设置值。
    //      * 如果未指定属性值，则将选择初始值。（查阅特定元素的文档以获取有关属性初始值的更多信息）*/
    //     x: 24; y: 16

    //     /* (3) 绑定高是宽的二倍
    //      * 一个属性可以依赖于一个或多个其他属性。这称为绑定。绑定属性在其依赖属性发生更改时会更新。
    //      * 它的工作方式类似于合同，在这种情况下，高度应始终是宽度的两倍。*/
    //     height: 2 * width

    //     /* (4) 自定义属性
    //      * 向元素添加新属性时，使用属性限定符，后跟类型、名称和可选初始值（property <type> <name> : <value>）。
    //      * 如果没有给出初始值，则选择默认初始值。
    //      * ✨还可以使用 default 关键字将一个属性声明为默认属性。
    //      * 如果在元素内部创建了另一个元素，但未明确绑定到属性，则该元素将绑定到默认属性。
    //      * 例如，当您添加子元素时会使用此关键字。如果子元素是可见元素，则会自动将其添加到类型列表的默认属性子元素中。
    //      * 详细讲解 => https://blog.csdn.net/2303_80346267/article/details/142654352 */
    //     property int times: 24

    //     /* (5) 属性别名 声明属性的另一种重要方式是使用别名关键字（property alias <name>: <reference>）。
    //      * 别名关键字允许我们将对象的属性或对象本身从类型内部转发到外部范围。属性别名不需要类型，它使用引用属性或对象的类型。*/
    //     property alias anotherTimes: thisLabel.times

    //     /* (6) 设置附加值的文本
    //      * text 属性依赖于 int 类型的自定义属性 times。基于 int 的值会自动转换为字符串类型。
    //      * 表达式本身是绑定的另一个示例，每次 times 属性发生变化时，文本都会更新。*/
    //     text: "Greetings " + times

    //     /* (7) 字体是一个分组属性
    //      * 某些属性是分组属性。当属性更具结构性且相关属性应分组在一起时，可使用此功能。
    //      * 另一种编写分组属性的方式是 font { family: "Ubuntu"; pixelSize: 24 }。*/
    //     font.family: "Ubuntu"
    //     font.pixelSize: 24

    //     /* (8) KeyNavigation 是一个附加属性
    //      * 某些属性属于元素类本身。这是针对在应用程序中仅出现一次的全局设置元素（例如键盘输入）进行的。
    //      * 写法为 <Element>.<property>: <value>。*/
    //     KeyNavigation.tab: otherLabel

    //     /* (9) 属性改变的信号处理程序
    //      * 对于每个属性，您都可以提供一个信号处理程序。此处理程序在属性更改后调用。
    //      * 例如，这里我们希望在高度更改时收到通知，并使用内置控制台将消息记录到系统中。*/
    //     onHeightChanged: console.log('height:', height)

    //     // focus 需要接收关键事件
    //     focus: true

    //     // 根据焦点值改变颜色
    //     color: focus ? "red" : "black"
    // }

    /* 元素 ID 仅应用于引用文档内的元素（例如，当前文件）。QML 提供了一种称为“动态作用域”的机制，
     * 其中稍后加载的文档会覆盖先前加载的文档中的元素 ID。这样，如果先前加载的文档中的元素 ID 尚未被覆盖，则可以引用这些元素 ID。
     * 这就像创建全局变量一样。不幸的是，这在实践中经常会导致非常糟糕的代码，因为程序依赖于执行顺序。不幸的是，此功能无法关闭。
     * 请谨慎使用此功能；或者，最好根本不要使用此机制。最好使用文档根元素上的属性将要提供给外部世界的元素导出。*/


    // Text {
    //     id: label

    //     x: 24; y: 24

    //     // 空格键的自定义计数器属性
    //     property int spacePresses: 0

    //     text: "Space pressed: " + spacePresses + " times"

    //     /* (1) 文本更改的处理程序。需要使用函数来捕获参数
    //      * 每次按下空格键导致文本发生变化时，文本更改处理程序 onTextChanged 都会打印当前文本。
    //      * 由于我们使用信号注入的参数，因此我们需要在此处使用函数语法。
    //      * 也可以使用箭头函数 ((text) => {})，但我们认为 function(text) {} 更具可读性。*/
    //     onTextChanged: function(text) {
    //         console.log("text changed to:", text)
    //     }

    //     // 打开焦点接受
    //     focus: true

    //     /* (2) 带有一些 JS 的处理程序
    //      * 当文本元素接收到空格键时（因为用户按下了键盘上的空格键），我们调用 JavaScript 函数increment()。*/
    //     Keys.onSpacePressed: {
    //         increment()
    //     }

    //     /* 清除退出时的文本
    //      * 按下 Esc 键后，再按空格键将不再更新显示，因为文本属性的先前绑定（文本：“按下空格键：”+spacePresses+”次”）已被破坏。
    //      * 当您有冲突的更改属性的策略时（如本例所示）（通过绑定更改属性增量来更新文本，并通过 JavaScript 赋值清除文本），
    //      * 则您无法使用绑定！您需要在两个属性更改路径上使用赋值，因为绑定将被赋值破坏（违反契约！）。*/
    //     Keys.onEscapePressed: {
    //         label.text = ''
    //     }

    //     /* (3) a JS function
    //      * 以 function <name>(<parameters>) { ... } 的形式定义 JavaScript 函数，用于增加我们的计数器 spacePresses。
    //      * 每次增加 spacePresses 时，绑定属性也会更新。*/
    //     function increment() {
    //         spacePresses = spacePresses + 1
    //     }
    // }
}
