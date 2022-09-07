import Foundation
import EventKit
import EventKitUI
import React

@objc(Calendar)
class Calendar: NSObject
{
  @objc
  func addEventToCalendar(_ titleEvent: String) {
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
          try eventStore.save(event, span: .thisEvent)
        } catch {
          
        }
      } else {
        
      }
    })
  }
}
