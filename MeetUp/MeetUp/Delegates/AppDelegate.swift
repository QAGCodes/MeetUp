//
//  AppDelegate.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/7/21.
//

import UIKit
import Parse
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    let notifCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let parseConfig = ParseClientConfiguration{
            $0.applicationId = "i1cxt6pBynTo8YSquLVCo5ta2z5Rs8F7zNKJI2ow"
            $0.clientKey = "VGjJIc9u2OSef2eVpT51tIJsenS6pBIng4Mz1Xh9"
            $0.server = "https://parseapi.back4app.com/"
        }
        
        Parse.initialize(with: parseConfig)
        let notificationTypes: UIUserNotificationType = [UIUserNotificationType.alert,UIUserNotificationType.badge, UIUserNotificationType.sound]
        let pushNotificationSettings = UIUserNotificationSettings(types: notificationTypes, categories: nil)
        UNUserNotificationCenter.current().delegate = self
        application.registerUserNotificationSettings(pushNotificationSettings)
        application.registerForRemoteNotifications()

        return true
    }
    
    func requestAuthForLocalNotifications() {
        notifCenter.delegate = self
        notifCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if error != nil {
                // Something went wrong
            }
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(UNNotificationPresentationOptions.init(arrayLiteral: [.alert, .badge]))
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier ==  "open"{
            NotificationCenter.default.post(name: NSNotification.Name("Detail"), object: nil)
        }
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func getNotificationSettings() {
         UNUserNotificationCenter.current().getNotificationSettings { (settings) in
             print("Notification settings: \(settings)")
             guard settings.authorizationStatus == .authorized else { return }
             UIApplication.shared.registerForRemoteNotifications()
         }
     }

     func application(_ application: UIApplication,
                      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
         createInstallationOnParse(deviceTokenData: deviceToken)
     }

     func application(_ application: UIApplication,
                      didFailToRegisterForRemoteNotificationsWithError error: Error) {
         print("Failed to register: \(error)")
     }

     func createInstallationOnParse(deviceTokenData:Data){
         if let installation = PFInstallation.current(){
             installation.setDeviceTokenFrom(deviceTokenData)
             installation.setObject(["accept"], forKey: "channels")
             if let userId = PFUser.current()?.objectId {
                    print(userId)
                     installation.setObject(userId, forKey: "userId")
             }
             installation.saveInBackground {
                 (success: Bool, error: Error?) in
                 if (success) {
                     print("You have successfully saved your push installation to Back4App!")
                 } else {
                     if let myError = error{
                         print("Error saving parse installation \(myError.localizedDescription)")
                     }else{
                         print("Uknown error")
                     }
                 }
             }
         }
     }
       


}


