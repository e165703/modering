//
//  Day_time.swift
//  modering_c
//
//  Created by 大城　拓千 on 2017/12/06.
//  Copyright © 2017年 大城　拓千. All rights reserved.
//

import Foundation
class Day_time{
    //次の月曜日
    class func Tommorow_notification() -> NSDate {
        let date = NSDate()
        let calender = NSCalendar.currentCalendar()
        let interval: NSTimeInterval
        interval = 60*60*24
        let nextDate = date.dateByAddingTimeInterval(interval)
        let fireDateComponents = calender.components([.Year , .Month ,.Day , .Weekday], fromDate: nextDate)
        fireDateComponents.hour = 0
        fireDateComponents.minute = 01
        fireDateComponents.second = 0
        return calender.dateFromComponents(fireDateComponents)!
    }
}