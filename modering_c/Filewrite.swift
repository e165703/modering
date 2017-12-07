//
//  FileWrite.swift
//  modering_c
//
//  Created by 大城　拓千 on 2017/12/07.
//  Copyright © 2017年 大城　拓千. All rights reserved.
//

import Foundation
import UIKit
class Filewrite{
    func a(){
        write()
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector:#selector(Filewrite.write), userInfo: nil, repeats: true)
    }
    @objc func write(){
        let n = NSProcessInfo()
        let i = n.systemUptime
        let d: String = String(i)
        do {
            try d.writeToFile("/Users/e165703/モデリングC/modering_c.txt", atomically: true, encoding: NSUTF8StringEncoding)
        } catch {
            print("aaa")
            // Failed to write file
        }
        
    }
}