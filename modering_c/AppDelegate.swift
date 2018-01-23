//
//  AppDelegate.swift
//  modering_c
//
//  Created by 大城　拓千 on 2017/11/16.
//  Copyright © 2017年 大城　拓千. All rights reserved.
//
import UIKit
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var counter = 0
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        let suimin = Filewrite()
        
        if application.applicationState != .active{
            suimin.slept_time()
            application.applicationIconBadgeNumber = 0
            application.cancelLocalNotification(notification)
        }else{
            if application.applicationIconBadgeNumber != 0{
                application.applicationIconBadgeNumber = 0
                application.cancelLocalNotification(notification)
            }
        }

            }
    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        application.registerUserNotificationSettings(
            UIUserNotificationSettings(types:
                UIUserNotificationType(rawValue: UIUserNotificationType.RawValue(UInt8(UIUserNotificationType.sound.rawValue)
                    | UInt8(UIUserNotificationType.badge.rawValue)
                    | UInt8(UIUserNotificationType.alert.rawValue))), categories: nil)
        )
        //if let notification = launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] as UILocalNotification,let userInfo = notification.userInfo{
            //application.applicationIconBadgeNumber = 0
            //application.cancelLocalNotification(notification)
        //}
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        print("aaa")
        let suimin = Filewrite()
        application.cancelAllLocalNotifications()
        
        suimin.a()
        
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        application.cancelAllLocalNotifications()
        
        let notification = UILocalNotification()
        notification.alertAction = "アプリに戻る"
        notification.alertBody = "ランキングが更新されました"
        notification.fireDate = NSDate(timeIntervalSinceNow: 60) as Date  // Test
        notification.soundName = UILocalNotificationDefaultSoundName
        // アイコンバッジに1を表示
        notification.applicationIconBadgeNumber = 1
        // あとのためにIdを割り振っておく
        notification.userInfo = ["notifyId": "ranking_update"]
        application.scheduleLocalNotification(notification)
        var i = 0
        var count = 1
        counter = 0
        while i == 0 {
            if count%100000000 == 0{
                count = 0
                suimin.zyouken()
            }
            count += 1
        }
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        if application.applicationIconBadgeNumber != 0{
            application.applicationIconBadgeNumber = 0
            print("application\(application.applicationIconBadgeNumber)")
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        counter += 1
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

