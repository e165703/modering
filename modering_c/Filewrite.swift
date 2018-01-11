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
    @objc func slept_time(){
        let a = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let b = formatter.stringFromDate(a)
        let d: String = String(b)
        do {
            try d.writeToFile("/Users/e165703/モデリングC/slept_time.txt", atomically: true, encoding: NSUTF8StringEncoding)
        } catch {
            print("aaa")
            // Failed to write file
        }
        
    }
    @objc func sleep_time(){
        let formatter = NSDateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "Asia/Tokyo")
        dateFormatter.locale = NSLocale(localeIdentifier: "ja")
        dateFormatter.dateFormat = "hh:mm:ss"
        let sleep = NSDate()
        let sleep2 = formatter.stringFromDate(sleep)
        let sleep3: String = String(sleep2)
        print(sleep2)
        do {
            let text = try String(contentsOfFile: "/Users/e165703/モデリングC/slept_time.txt", encoding: NSUTF8StringEncoding)
            let get_up = sleep3.componentsSeparatedByString(":")
            let sleeptime = text.componentsSeparatedByString(":")
            var getup_hour: Int = Int(get_up[0])!
            getup_hour = 60*60*getup_hour
            var getup_minute: Int = Int(get_up[1])!
            getup_minute = 60*getup_minute
            var getup_second: Int = Int(get_up[2])!
            var getup_all = getup_hour+getup_second+getup_minute
            print(getup_all)
            var sleeptime_hour: Int = Int(sleeptime[0])!
            sleeptime_hour = 60*60*sleeptime_hour
            var sleeptime_minute: Int = Int(sleeptime[1])!
            sleeptime_minute = 60*sleeptime_minute
            var sleeptime_second: Int = Int(sleeptime[2])!
            var sleeptime_all = sleeptime_hour+sleeptime_second+sleeptime_minute
            print(sleeptime_all)
            var suimin_second = getup_all-sleeptime_all
            let suimin_hour = suimin_second/3600
            let suimin_minute = (suimin_second%3600)/60
            let suimin_second2 = (suimin_second%3600)%60
            var date_String = String(format: "%02d:%02d:%02d",suimin_hour,suimin_minute,suimin_second2)
            print(date_String)
        } catch {
            print("error")
        }
    }
}