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
        let calender = NSCalendar.currentCalendar()
        let interval: NSTimeInterval
        interval = 0
        let nextDate = date.dateByAddingTimeInterval(interval)
        let fireDateComponents = calender.components([.Year , .Month ,.Day , .Weekday], fromDate: nextDate)
        fireDateComponents.hour = 22
        fireDateComponents.minute = 0
        fireDateComponents.second = 0
        return calender.dateFromComponents(fireDateComponents)!
    }
}