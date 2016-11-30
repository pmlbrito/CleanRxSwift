//
//  CRXPListUtils.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 30/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation

class CRXPListUtils {
  
  static func getPListFileForBundleConfigKey(filenameKey: String) -> NSDictionary? {
    let path = Bundle.main.path(forResource: filenameKey, ofType: "plist")
    var dict: NSDictionary?
    dict = nil
    if path != nil {
      dict = NSDictionary(contentsOfFile: path!)
    }
    return dict
  }
  
}
