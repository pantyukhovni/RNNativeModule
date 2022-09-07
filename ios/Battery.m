#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface
RCT_EXTERN_MODULE(Battery, RCTEventEmitter);

RCT_EXTERN_METHOD(isLowPowerModeEnabled: (RCTPromiseResolveBlock) resolve reject: (RCTPromiseRejectBlock) reject)
@end

