#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTLog.h>
#import "Calendar.h"

#import <React/RCTEventEmitter.h>


@interface RCT_EXTERN_MODULE(Calendar, NSObject)
RCT_EXTERN_METHOD(addEventToCalendar: (NSString *)titleEvent
                  startDate: (nonnull NSNumber)startDate
                  endDate: (nonnull NSNumber)endDate
                  resolve:(RCTPromiseResolveBlock) resolve
                  reject: (RCTPromiseRejectBlock)reject)
@end

