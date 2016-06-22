//
//  UIColor+QSUAdditions.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import UIKit

public extension UIColor {
  public convenience init?(hexString: String) {
    let r, g, b, a: CGFloat
    
    if hexString.hasPrefix("#") {
      let start = hexString.startIndex.advancedBy(1)
      let hexColor = hexString.substringFromIndex(start)
      
      if hexColor.characters.count == 8 {
        let scanner = NSScanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexLongLong(&hexNumber) {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255
          
          self.init(red: r, green: g, blue: b, alpha: a)
          return
        }
      }
    }
    
    return nil
  }
  
  func toHexString() -> String {
    var r:CGFloat = 0
    var g:CGFloat = 0
    var b:CGFloat = 0
    var a:CGFloat = 0
    
    getRed(&r, green: &g, blue: &b, alpha: &a)
    
    let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
    
    return NSString(format:"#%06x", rgb) as String
  }
  
  func imageWithColor(size: CGSize = CGSizeMake(60, 60)) -> UIImage {
    let rect = CGRectMake(0, 0, size.width, size.height)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, rect);
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext();
    
    return image;
  }
  
  static func randomColor() -> UIColor {
    let r = CGFloat.random()
    let g = CGFloat.random()
    let b = CGFloat.random()
    
    // If you wanted a random alpha, just create another
    // random number for that too.
    return UIColor(red: r, green: g, blue: b, alpha: 1.0)
  }
}