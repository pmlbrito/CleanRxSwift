//
//  UIButton+CRXAdditions.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 27/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//


import UIKit

extension UIButton {
  func setBackgroundColor(color: UIColor, forState: UIControlState) {
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), color.CGColor)
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRect(x: 0, y: 0, width: 1, height: 1))
    let colorImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    self.setBackgroundImage(colorImage, forState: forState)
  }
}
