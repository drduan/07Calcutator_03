//
//  CalcLogic.swift
//  07Calcutator_03
//
//  Created by duanxudong on 15/10/28.
//  Copyright © 2015年 duanxudong. All rights reserved.
//

import Foundation


enum Operator:Int{
    
    case Plus = 200
    case Minus = 201
    case Multiply = 202
    case Devide = 203
    case Default = 0
}
class CalcuLogic {
    var lastRetainValue:Double
    var operatorV:Operator
    var isMainLabelTextTemporary:Bool
    
    init(){
        self.lastRetainValue = 0.0
        self.operatorV = Operator.Default
        isMainLabelTextTemporary = false
        
    }
    
    func doesStringContainDecimal(string:String) ->Bool{
        
        for ch in string.unicodeScalars{
            if ch == "."{
                return true
        }
         
        }
        return false
    }
    
    func clean(){
        
        lastRetainValue = 0.0
        isMainLabelTextTemporary = false
        operatorV = Operator.Default
        
    }


    
        func updateMainLabelStringByNumberTag(tag:Int,withMainLabelString mainLabelString:String ) ->String {
            var string = mainLabelString
            if isMainLabelTextTemporary {
                string = "0"
//                isMainLabelTextTemporary = false
            }
            isMainLabelTextTemporary = false
            
//            let optNumber = tag - 100;
            let optNumber = tag ;
            
            let mainLabelDouble = (string as NSString).doubleValue
            if (mainLabelDouble == 0 && doesStringContainDecimal(string) == false) {
                return String(optNumber)
            }
            let resultString = string + String(optNumber)
            return resultString
        
    }
    
        func calculateByTag (tag:Int ,withMainLabelString mainLabelString:String) -> String{
        
        let currentValue = (mainLabelString as NSString).doubleValue
        switch(operatorV){
        case .Plus:
            lastRetainValue += currentValue
        case .Minus:
            lastRetainValue -= currentValue
        case .Multiply:
            lastRetainValue *= currentValue
        case .Devide:
            if currentValue != 0{
                lastRetainValue /= currentValue
                
                
            }else
            {
                operatorV = Operator.Default
                isMainLabelTextTemporary = true
                return "错误"
                
            }
            
        default:
            lastRetainValue = currentValue
            }
            operatorV = Operator(rawValue: tag)!
            let resultString = NSString(format: "%g", lastRetainValue)
            isMainLabelTextTemporary = true
            return resultString as String
}
}