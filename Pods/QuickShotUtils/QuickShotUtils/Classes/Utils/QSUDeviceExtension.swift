//
//  QSUDeviceExtension.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation
import UIKit

public enum iPhoneDeviceModel : String {
  case simulator = "simulator/sandbox",
  iPod1          = "iPod 1",
  iPod2          = "iPod 2",
  iPod3          = "iPod 3",
  iPod4          = "iPod 4",
  iPod5          = "iPod 5",
  iPad2          = "iPad 2",
  iPad3          = "iPad 3",
  iPad4          = "iPad 4",
  iPhone4        = "iPhone 4",
  iPhone4S       = "iPhone 4S",
  iPhone5        = "iPhone 5",
  iPhone5S       = "iPhone 5S",
  iPhone5C       = "iPhone 5C",
  iPadMini1      = "iPad Mini 1",
  iPadMini2      = "iPad Mini 2",
  iPadMini3      = "iPad Mini 3",
  iPadAir1       = "iPad Air 1",
  iPadAir2       = "iPad Air 2",
  iPhone6        = "iPhone 6",
  iPhone6plus    = "iPhone 6 Plus",
  iPhone6S       = "iPhone 6S",
  iPhone6Splus   = "iPhone 6S Plus",
  iPhoneSE       = "iPhone SE",
  unrecognized   = "?unrecognized?"
}

public class QSUDeviceExtension {
  
  static func type() -> iPhoneDeviceModel {
    var systemInfo = utsname()
    uname(&systemInfo)
    let modelCode = withUnsafeMutablePointer(&systemInfo.machine) {
      ptr in String.fromCString(UnsafePointer<CChar>(ptr))
    }
    var modelMap : [ String : iPhoneDeviceModel ] = [
      "i386"      : .simulator,
      "x86_64"    : .simulator,
      "iPod1,1"   : .iPod1,
      "iPod2,1"   : .iPod2,
      "iPod3,1"   : .iPod3,
      "iPod4,1"   : .iPod4,
      "iPod5,1"   : .iPod5,
      "iPad2,1"   : .iPad2,
      "iPad2,2"   : .iPad2,
      "iPad2,3"   : .iPad2,
      "iPad2,4"   : .iPad2,
      "iPad2,5"   : .iPadMini1,
      "iPad2,6"   : .iPadMini1,
      "iPad2,7"   : .iPadMini1,
      "iPhone3,1" : .iPhone4,
      "iPhone3,2" : .iPhone4,
      "iPhone3,3" : .iPhone4,
      "iPhone4,1" : .iPhone4S,
      "iPhone5,1" : .iPhone5,
      "iPhone5,2" : .iPhone5,
      "iPhone5,3" : .iPhone5C,
      "iPhone5,4" : .iPhone5C,
      "iPad3,1"   : .iPad3,
      "iPad3,2"   : .iPad3,
      "iPad3,3"   : .iPad3,
      "iPad3,4"   : .iPad4,
      "iPad3,5"   : .iPad4,
      "iPad3,6"   : .iPad4,
      "iPhone6,1" : .iPhone5S,
      "iPhone6,2" : .iPhone5S,
      "iPad4,1"   : .iPadAir1,
      "iPad4,2"   : .iPadAir2,
      "iPad4,4"   : .iPadMini2,
      "iPad4,5"   : .iPadMini2,
      "iPad4,6"   : .iPadMini2,
      "iPad4,7"   : .iPadMini3,
      "iPad4,8"   : .iPadMini3,
      "iPad4,9"   : .iPadMini3,
      "iPhone7,1" : .iPhone6plus,
      "iPhone7,2" : .iPhone6,
      "iPhone8,1" : .iPhone6S,
      "iPhone8,2" : .iPhone6Splus,
      "iPhone8,4" : .iPhoneSE
    ]
    
    if let model = modelMap[String.fromCString(modelCode!)!] {
      return model
    }
    return iPhoneDeviceModel.unrecognized
  }
  
  
  static func isLessThaniPhone6() -> Bool {
    
    var isLessThan = false;
    
    var machineType : iPhoneDeviceModel = iPhoneDeviceModel.unrecognized;
    var machineSwiftString : String = ""
    if Platform.isSimulator {
      // this neat trick is found at http://kelan.io/2015/easier-getenv-in-swift/
      if let dir = NSProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
        machineSwiftString = dir
        
        var modelMap : [ String : iPhoneDeviceModel ] = [
          "i386"      : .simulator,
          "x86_64"    : .simulator,
          "iPod1,1"   : .iPod1,
          "iPod2,1"   : .iPod2,
          "iPod3,1"   : .iPod3,
          "iPod4,1"   : .iPod4,
          "iPod5,1"   : .iPod5,
          "iPad2,1"   : .iPad2,
          "iPad2,2"   : .iPad2,
          "iPad2,3"   : .iPad2,
          "iPad2,4"   : .iPad2,
          "iPad2,5"   : .iPadMini1,
          "iPad2,6"   : .iPadMini1,
          "iPad2,7"   : .iPadMini1,
          "iPhone3,1" : .iPhone4,
          "iPhone3,2" : .iPhone4,
          "iPhone3,3" : .iPhone4,
          "iPhone4,1" : .iPhone4S,
          "iPhone5,1" : .iPhone5,
          "iPhone5,2" : .iPhone5,
          "iPhone5,3" : .iPhone5C,
          "iPhone5,4" : .iPhone5C,
          "iPad3,1"   : .iPad3,
          "iPad3,2"   : .iPad3,
          "iPad3,3"   : .iPad3,
          "iPad3,4"   : .iPad4,
          "iPad3,5"   : .iPad4,
          "iPad3,6"   : .iPad4,
          "iPhone6,1" : .iPhone5S,
          "iPhone6,2" : .iPhone5S,
          "iPad4,1"   : .iPadAir1,
          "iPad4,2"   : .iPadAir2,
          "iPad4,4"   : .iPadMini2,
          "iPad4,5"   : .iPadMini2,
          "iPad4,6"   : .iPadMini2,
          "iPad4,7"   : .iPadMini3,
          "iPad4,8"   : .iPadMini3,
          "iPad4,9"   : .iPadMini3,
          "iPhone7,1" : .iPhone6plus,
          "iPhone7,2" : .iPhone6,
          "iPhone8,1" : .iPhone6S,
          "iPhone8,2" : .iPhone6Splus,
          "iPhone8,4" : .iPhoneSE
        ]
        
        if let model = modelMap[String.fromCString(machineSwiftString)!] {
          machineType = model
        }
      }
    }
    else {
      machineType = QSUDeviceExtension.type();
    }
    
    
    switch machineType {
    case .iPhone4S:
      isLessThan = true;
      break;
    case .iPhone5:
      isLessThan = true;
      break;
    case .iPhone5S:
      isLessThan = true;
      break;
    case .iPhoneSE:
      isLessThan = true;
      break;
    case .iPhone6:
      isLessThan = false;
      break;
    case .iPhone6plus:
      isLessThan = false;
      break;
    case .iPhone6S:
      isLessThan = false;
      break;
    case .iPhone6Splus:
      isLessThan = false;
      break;
    default:
      isLessThan = false;
      break;
    }
    
    if(machineSwiftString.contains("iPod") || machineSwiftString.contains("iPad")){
      isLessThan = true;
    }
    
    return isLessThan;
  }
  
  struct Platform {
    static let isSimulator: Bool = {
      var isSim = false
      #if arch(i386) || arch(x86_64)
        isSim = true
      #endif
      return isSim
    }()
  }
  
  
  public func getPlatformNSString() -> String {
    var machineSwiftString : String = ""
    
    if Platform.isSimulator {
      // this neat trick is found at http://kelan.io/2015/easier-getenv-in-swift/
      if let dir = NSProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
        machineSwiftString = dir
      }
    }
    else {
      var size : size_t = 0
      sysctlbyname("hw.machine", nil, &size, nil, 0)
      var machine = [CChar](count: Int(size), repeatedValue: 0)
      sysctlbyname("hw.machine", &machine, &size, nil, 0)
      machineSwiftString = String.fromCString(machine)!
    }
    
    return machineSwiftString
  }
}
