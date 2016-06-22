//
//  QSUBasicLoadingIndicator.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import UIKit

public class QSUBasicLoadingIndicator{
  
  var overlayView: UIView?;
  var activityIndicator: UIActivityIndicatorView?;
  
  class var shared: QSUBasicLoadingIndicator {
    struct Static {
      static let instance: QSUBasicLoadingIndicator = QSUBasicLoadingIndicator()
    }
    return Static.instance
  }
  
  private init(){
    let window = UIApplication.sharedApplication().windows.first!
    overlayView = UIView(frame: window.frame);
    overlayView?.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8);
    overlayView?.clipsToBounds = true
    
    activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 40, 40))
    activityIndicator?.activityIndicatorViewStyle = .WhiteLarge
    activityIndicator?.center = CGPointMake((overlayView?.bounds.width)! / 2, (overlayView?.bounds.height)! / 2)
    activityIndicator?.color = UIColor.whiteColor();
    
    overlayView!.addSubview(activityIndicator!)
  }
  
  
  
  public func show() {
    //without animations
    //    let window = UIApplication.sharedApplication().windows.first!
    //    window.addSubview(overlayView!)
    //    activityIndicator!.startAnimating()
    
    //with animations
    let window = UIApplication.sharedApplication().windows.first!
    window.addSubview(self.overlayView!)
    self.activityIndicator!.startAnimating()
    
    UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: {
      self.overlayView!.alpha = 0.8
      }, completion: { finished in
    })
  }
  
  public func hide() {
    //without animations
    //    activityIndicator!.stopAnimating()
    //    overlayView!.removeFromSuperview()
    
    //with animations
    UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: {
      self.overlayView!.alpha = 0.0
      }, completion: { finished in
        self.activityIndicator!.stopAnimating()
        self.overlayView!.removeFromSuperview()
    })
  }
}
