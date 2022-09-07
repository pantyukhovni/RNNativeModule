//
//  Battery.swift
//  RNBatteryNativeModule
//
//  Created by Nikita on 05.09.2022.
//

import Foundation
import React

@objc(Battery)
class Battery: RCTEventEmitter  {
  
  // переменная слушателя
  private var hasListeners = false;
  
  override init(){
    super.init();
    
    UIDevice.current.isBatteryMonitoringEnabled = true;
  }
  
  @objc
  func isLowPowerModeEnabled(_ resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock){
    resolve(ProcessInfo.processInfo.isLowPowerModeEnabled)
    
  }
  
  override func startObserving() {
          
    hasListeners = true;
    
    // setup the listener
    
    NotificationCenter.default.addObserver(self, selector: #selector(powerModeDidChange), name: NSNotification.Name.NSProcessInfoPowerStateDidChange, object: nil)
    
  }
  
  override func stopObserving() {
    hasListeners = false;
    
    // remove listener
    
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NSProcessInfoPowerStateDidChange, object: nil)
  }
  
  @objc
  func powerModeDidChange() {
    if (!hasListeners){
      return;
    }
    let lowPowerEnabled = ProcessInfo.processInfo.isLowPowerModeEnabled;
    
    self.sendEvent(withName: "isLowPowerModeEnabled", body: lowPowerEnabled)
  }
  
  override func supportedEvents() -> [String]! {
    return ["isLowPowerModeEnabled"];
  }
  
  override class func requiresMainQueueSetup() -> Bool {
    return false;
  }
}
