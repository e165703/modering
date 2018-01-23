//
//  Day_time.swift
//  modering_c
//
//  Created by 大城　拓千 on 2017/12/06.
//  Copyright © 2017年 大城　拓千. All rights reserved.
//

import Foundation
class Moning_time{
    class func Tommorow_notification() -> NSDate {
        let date = NSDate()
        let calender = NSCalendar.current
        let interval: TimeInterval
        
        let calendar2 = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let calendarComponents = calendar2.components(.hour, from: date as Date)
        let hour = calendarComponents.hour
        
        //if hour >= 0 && hour <= 7{
        //     interval = 0
        //}
        //else{
        //    interval = 60*60*24
        //}最終的にこうする
        interval = 0
        
        let nextDate = date.addingTimeInterval(interval)
        //let fireDateComponents = calender.components([.Year , .Month ,.Day , .Weekday], fromDate: nextDate)
        //fireDateComponents.hour = 22
        //fireDateComponents.minute = 0
        //fireDateComponents.second = 0
        //return calender.dateFromComponents(fireDateComponents)!
        return date
    }
}
