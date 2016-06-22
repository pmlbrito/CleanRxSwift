//
//  Math+QSUAdditions.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation

public extension CGFloat {
  func roundToDecimals(decimals: Int = 2) -> CGFloat {
    let divisor = pow(10.0, CGFloat(decimals))
    return round(self * divisor) / divisor
  }
  
  static func random() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
  }
}

public extension Double {
  /// Rounds the double to decimal places value
  func roundToDecimals(decimals:Int) -> Double {
    let divisor = pow(10.0, Double(decimals))
    return round(self * divisor) / divisor
  }
}

