//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
  Swift新元素
 **/

/*
 1. 柯里化函数：把接受多个参数的方法进行一些变形，使其更加灵活的方法。本质：函数的返回值是闭包
**/
func addOne(num: Int) -> Int {
    return num + 1
}
func addTwo(num: Int) -> Int {
    return num + 2
}
func addThree(num: Int) -> Int {
    return num + 3
}

print(addOne(num: 4), addTwo(num: 4))
// 以上三个函数表达的内容十分有限，如果我们需要给一个数字加2或者3，需要复制相应的函数。为了一个更加通用的方法，柯里化函数就派上用场了。
func addTo(_ adder: Int) -> (Int) -> Int {
    return {
        num in
        return num + adder
    }
}

let twoAddFour = addTo(2)(4)

print(twoAddFour, addTo(3)(6))

// 柯里化函数是量产相似函数的好方法，可以通过柯里化一个函数来减少很多重复的代码。

/*
 2. 讲protocol的方法声明为mutating：目的是为了能在protocol协议方法中修改struct和enum中变量的值。class是可以任意修改自己的成员变量的，所以不需要mutating修饰
 **/

protocol Vehicle {
    var numberOfWheels: Int { get }
    var color: UIColor { get }
    mutating func changeColor()
}

struct MyCar: Vehicle {
    var numberOfWheels: Int = 4
    
    var color: UIColor = .blue
    
    mutating func changeColor() {
        color = .red
    }
}

print(MyCar().color)

/*
 3. Sequence
 **/

/*
 4. 多元组Tuple
 **/

/*
 5. @autoclosure 和 ??： @autoclosure 做的事情就是把一句表达式自动的封装成一个闭包，这样有时候在语法上会非常的漂亮。
 **/

func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("true")
    }
}

print(logIfTrue( 2 > 1 ))

func ahah<T>(optional: T?, defaultValue: @autoclosure () -> T) -> T {
    switch optional {
    case .some(let value):
        return value
    case .none:
        return defaultValue()
    }
}

var level: Int?
let startLevel: Int = 4

print(ahah(optional: level, defaultValue: startLevel)
//TODO: 但是如果这个默认值是通过一系列复 杂计算得到的话，可能会成为浪费 -- 因为其实如果 optional不是 nil 的话，我们实际上是完全 没有用到这个默认值，而会直接返回 optional 解包后的值的 ???  举例说明？？？？？






