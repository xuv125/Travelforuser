//
//  String.swift
//  travelforuser
//
//  Created by 倫星 on 2014/06/19.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import Foundation

extension String {
    //分割字符
    func split(s:String)->String[]{
        if s.isEmpty{
            var x=String[]()
            for y in self{
                x.append(String(y))
            }
            return x
        }
        return self.componentsSeparatedByString(s)
    }
    //去掉左右空格
    func trim()->String{
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    //是否包含字符串
    func has(s:String)->Bool{
        if self.rangeOfString(s) {
            return true
        }else{
            return false
        }
    }
    //是否包含前缀
    func hasBegin(s:String)->Bool{
        if self.hasPrefix(s) {
            return true
        }else{
            return false
        }
    }
    //是否包含后缀
    func hasEnd(s:String)->Bool{
        if self.hasSuffix(s) {
            return true
        }else{
            return false
        }
    }
    //统计长度
    func length()->Int{
        return countElements(self)
    }
    //统计长度(别名)
    func size()->Int{
        return countElements(self)
    }
    //截取字符串
    func substr(range:Int...)->String{
        if range[0]==0{
            return self.substringToIndex(range[1])
        }else{
            return self.substringFromIndex(range[0])
        }
    }
    //重复字符串
    func repeat(times: Int) -> String{
        var result = ""
        for i in 0..times {
            result += self
        }
        return result
    }
    //反转
    func reverse()-> String{
        var s=self.split("").reverse()
        var x=""
        for y in s{
            x+=y
        }
        return x
    }
    
    // Swift
    //let s = "foobar"
    //let x = s[4]       // a
    //let y = s[3..5]    // ba

    
    subscript(p:Int) -> String {
        return self[p..(p+1)]
    }
    subscript(r:Range<Int>) -> String {
        
        func _index(pos:Int) -> String.Index {
            let end = self.endIndex
            var p = self.startIndex
            for var i = 0; i < pos; ++i {
                if p == end {
                    break;
                }
                p = p.succ()
            }
            return p
            }
        
        let s = self._index(r.startIndex)
            let e = self._index(r.endIndex)
            let range = Range(start:s, end:e)
            return self.substringWithRange(range)
    }
    
    // convert
    static func stringWithCurrencyStyle(f:Float) -> String {
        var formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        var str:String = formatter.stringFromNumber(f)

        return str
    }

}
