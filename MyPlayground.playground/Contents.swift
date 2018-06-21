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

print(ahah(optional: level, defaultValue: startLevel))
//TODO: 但是如果这个默认值是通过一系列复 杂计算得到的话，可能会成为浪费 -- 因为其实如果 optional不是 nil 的话，我们实际上是完全 没有用到这个默认值，而会直接返回 optional 解包后的值的 ???  举例说明？？？？？
/*
 6.@escaping：
 **/

/*
 7.Optional Chaining：使用的时候可以通过Optional Binding 来判定方法是否调用成功。
 **/

/*
 8.操作符：重载运算符，注意使用的时候要声明这个重载运算符
 **/

/*
 9.func修饰词： inout等。要注意的是参数的修饰是具有传递性的，就是说对于跨越层级的调用，我们要保证参数的修饰是统一的。
 **/

/*
 10.字面量表达
 **/

/*
 11.下标：给Array传递一个数组类型的下标，取出特定的几个元素。
 **/
extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range!")
                result.append(self[i])
            }
            return result
        }
        set {
            for (index, i) in input.enumerated() {
                assert(i < self.count, "Index out of range!")
                self[i] = newValue[index]
            }
        }
    }
}

var array = [1, 2, 3, 4, 5]
array[[0, 2, 3]]

/*
 12.方法嵌套：方法成为一等公民了，也就是说我们可以将方法当做变量或者参数来使用了。更进一步，我们可以在方法中定义新的方法，这给代码层级和访问级别控制带来新的选择。方法内部的几个方法不用抽到最外层，这样讲内部相关的几个方法放到appendQuery中，不失为一种更好的组织形式。
 **/
func appendQuery(url: String,
                 key: String,
                 value: AnyObject) -> String {
    func appendQueryDictionary(url: String,
                               key: String,
                               value: [String: AnyObject]) -> String {
        // ...
        var result = ""
        return result
    }
    func appendQueryArray(url: String,
                               key: String,
                               value: [AnyObject]) -> String {
        // ...
        var result = ""
        return result
    }

    func appendQuerySingle(url: String,
                               key: String,
                               value: AnyObject) -> String {
        // ...
        var result = ""
        return result
    }
    
    if let dictionary = value as? [String: AnyObject] {
        return appendQueryDictionary(url: url, key: key, value: dictionary)
    } else if let array = value as? [AnyObject] {
        return appendQueryArray(url: url, key: key, value: array)
    } else {
        return appendQuerySingle(url: url, key: key, value: value)
    }
}

/*
 13.命名空间：OC中一个一直以来令人诟病的地方就是没有命名空间，在应用开发时，所有的代码和引用的静态库最终都会被编译到同一个域和二进制中，这就很容易造成冲突。和C#这样的显式在文件中指定命名空间不同，swift的命名空间是基于module而不是在代码中显示的指明，每个module代表了swift中的一个命名空间。
 **/

/*
 14.typealias：
 **/

/*
 15.associdatedtype：重要未看~~~
 **/



