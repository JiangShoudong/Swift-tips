//
//  Swift新元素1.swift
//  Swifter-tips
//
//  Created by 姜守栋 on 2018/4/20.
//  Copyright © 2018年 Nick.Inc. All rights reserved.
//

import UIKit

class Swift___1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        print(addTo(2)(4))
        let f = myClass.method
        
        let object = myClass()
        let result = f(object)(1)
        
        print(result)
//        let (a, b, c) = abc()
//print(a)
        var a = 3
        var b = 4
        (a, b) = (b, a)
        print(a)
    }
    
    func abc() -> (Int, Int, String) {
        return (3, 5, "Carl")
    }
    /// 柯里化
    func addTo(_ adder: Int) -> (Int) -> Int {

        return {
            return adder + $0
        }
    }
    
}
class myClass {
    
    func method(number: Int) -> Int {
        
        return number + 1
        
    }

}
