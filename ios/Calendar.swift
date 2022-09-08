import Foundation
import EventKit
import EventKitUI
import React

@objc(Calendar)
class Calendar: NSObject
{
  @objc(addEventToCalendar:startDate:endDate:resolve:reject:)
  func addEventToCalendar(_ titleEvent: String, startDate: NSNumber, endDate: NSNumber, resolve:  @escaping RCTPromiseResolveBlock, reject:  @escaping RCTPromiseRejectBlock) {
    let eventStore = EKEventStore();
    
    eventStore.requestAccess(to: .event, completion: {(granted, error) in
      if (granted) && (error == nil) {
        let event: EKEvent = EKEvent(eventStore: eventStore)
        event.title = titleEvent
        event.startDate = Date()
        event.endDate = Date()
        event.notes = "This is a note"
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        do {
          try eventStore.save(event, span: .thisEvent);
          resolve("Событие успешно добавлено в календарь");
        } catch let err as NSError{
          reject("Error", "Не удалось добавить событие в календарь", err);
        }
      } else {
        reject("Permission_Error", "Не удалось получить доступ к календарю", error);
      }
    })
  }
}
