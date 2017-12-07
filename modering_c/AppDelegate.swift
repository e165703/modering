//
//  AppDelegate.swift
//  modering_c
//
//  Created by 大城　拓千 on 2017/11/16.
//  Copyright © 2017年 大城　拓千. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        if application.applicationState != .Active{
            application.applicationIconBadgeNumber = 0
            application.cancelLocalNotification(notification)
        }else{
            if application.applicationIconBadgeNumber != 0{
                application.applicationIconBadgeNumber = 0
                application.cancelLocalNotification(notification)
            }
        }

            }
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let notiSettings = UIUserNotificationSettings(forTypes:[.Alert,.Sound,.Badge], categories:nil)
        application.registerUserNotificationSettings(notiSettings)
        application.registerForRemoteNotifications()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        let suimin = Filewrite()
        suimin.a()
        
        
        application.cancelAllLocalNotifications()
        let notification = UILocalNotification()
        notification.alertAction = "アプリを開く"
        notification.alertBody = "おはよう御座います！"
        notification.fireDate = Day_time.Tommorow_notification()
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.applicationIconBadgeNumber = 1
        notification.userInfo = ["notifyID":"modering"]
        application.scheduleLocalNotification(notification)
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

