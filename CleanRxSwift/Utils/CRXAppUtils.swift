//
//  CRXAppUtils.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 01/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation

typealias FirstRunCompletion = (Bool?, NSError?) -> Void

class CRXAppUtils {
  
  static func checkForFirstLaunch(_ onCompletion: FirstRunCompletion){
    if(UserDefaults.standard.bool(forKey: "HasLaunchedOnce") == false)
    {
      // This is the first launch ever
      UserDefaults.standard.set(true, forKey: "HasLaunchedOnce")
      UserDefaults.standard.synchronize()
      
      //clear all auth data and other stuff
      onCompletion(true, nil);
      return;
    }
    
    onCompletion(false, nil); //if we want, we can pass an error
  }
}
