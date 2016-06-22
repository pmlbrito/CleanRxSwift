//
//  UIViewController+QSUAdditions.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation

public extension UIViewController {
  
  class func fromClassName(className : String) -> UIViewController {
    var realClassName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String + "." + className
    realClassName = realClassName.stringByReplacingOccurrencesOfString(" ", withString: "_")
    let klass = NSClassFromString(realClassName) as! UIViewController.Type
    return klass.init()
  }
  
}