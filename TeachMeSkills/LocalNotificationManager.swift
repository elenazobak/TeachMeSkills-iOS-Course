//
//  LocalNotificationManager.swift
//  TeachMeSkills
//
//  Created by Elena Zobak on 2/13/24.
//

import UserNotifications

class LocalNotificationManager {
    
    let id = UUID().uuidString
    
    
    func createNotification() {
        
        let title = "Local Notification"
        let content = UNMutableNotificationContent()
        content.title = title
        content.sound = UNNotificationSound.default
        
       var dateComponents = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: Date())
        
        dateComponents.hour = 18
        dateComponents.minute = 20
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        
    }
    
    
}
