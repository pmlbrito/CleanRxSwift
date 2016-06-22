//
//  QSUPlistUtils.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation

public class QSUPlistUtils {
  
  static func getPListFileForBundleConfigKey(filenameKey: String) -> NSDictionary? {
    let path = NSBundle.mainBundle().pathForResource(filenameKey, ofType: "plist");
    
    var dict: NSDictionary?
    dict = nil;
    if(path != nil){
      dict = NSDictionary(contentsOfFile: path!);
    }
    
    return dict;
  }
  
}