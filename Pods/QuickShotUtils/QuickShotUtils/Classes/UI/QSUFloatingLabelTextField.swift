//
//  QSUFloatingLabelTextField.swift based on FFFloatLabelTextField (https://github.com/FahimF/FloatLabelFields)
//  With custom adjustments regarding behaviour on empty text
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import UIKit

@IBDesignable public class QSUFloatingLabelTextField: UITextField {
  let animationDuration = 0.3
  var title = UILabel()
  
  let defaultPadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20);
  
  // MARK:- Properties
  override public var accessibilityLabel:String! {
    get {
      if isNilOrEmpty(text) {
        return title.text
      } else {
        return text
      }
    }
    set {
      self.accessibilityLabel = newValue
    }
  }
  
  override public var placeholder:String? {
    didSet {
      title.text = placeholder
      title.sizeToFit()
    }
  }
  
  override public var attributedPlaceholder:NSAttributedString? {
    didSet {
      title.text = attributedPlaceholder?.string
      title.sizeToFit()
    }
  }
  
  var titleFont:UIFont = UIFont.systemFontOfSize(11.0) {
    didSet {
      title.font = titleFont
      title.sizeToFit()
    }
  }
  
  @IBInspectable var hintYPadding:CGFloat = 0.0
  
  @IBInspectable var titleYPadding:CGFloat = 0.0 {
    didSet {
      var r = title.frame
      r.origin.y = titleYPadding
      title.frame = r
    }
  }
  
  @IBInspectable var titleTextColour:UIColor = UIColor.grayColor() {
    didSet {
      if !isFirstResponder() {
        title.textColor = titleTextColour
      }
    }
  }
  
  @IBInspectable var titleActiveTextColour:UIColor! {
    didSet {
      if isFirstResponder() {
        title.textColor = titleActiveTextColour
      }
    }
  }
  
  // MARK:- Init
  required public init(coder aDecoder:NSCoder) {
    super.init(coder:aDecoder)!
    setup()
  }
  
  override init(frame:CGRect) {
    super.init(frame:frame)
    setup()
  }
  
  // MARK:- Overrides
  override public func layoutSubviews() {
    super.layoutSubviews()
    setTitlePositionForTextAlignment()
    let isResp = isFirstResponder()
    if isResp && !isNilOrEmpty(text) {
      title.textColor = titleActiveTextColour
    } else {
      title.textColor = titleTextColour
    }
    // Should we show or hide the title label?
    if isNilOrEmpty(text) {
      // Hide
      hideTitle(isResp)
    } else {
      // Show
      showTitle(isResp)
    }
  }
  
  override public func textRectForBounds(bounds:CGRect) -> CGRect {
    var r = super.textRectForBounds(bounds);
    if !isNilOrEmpty(text) {
      var top = ceil(title.font.lineHeight + hintYPadding)
      top = min(top, maxTopInset())
      r = UIEdgeInsetsInsetRect(r, UIEdgeInsetsMake(top, 0.0, 0.0, 0.0))
    }
    //    return CGRectIntegral(r)
    return UIEdgeInsetsInsetRect(r, defaultPadding)
  }
  
  override public func editingRectForBounds(bounds:CGRect) -> CGRect {
    var r = super.editingRectForBounds(bounds)
    if !isNilOrEmpty(text) {
      var top = ceil(title.font.lineHeight + hintYPadding)
      top = min(top, maxTopInset())
      r = UIEdgeInsetsInsetRect(r, UIEdgeInsetsMake(top, 0.0, 0.0, 0.0))
    }
    //    return CGRectIntegral(r)
    return UIEdgeInsetsInsetRect(r, defaultPadding)
  }
  
  override public func clearButtonRectForBounds(bounds:CGRect) -> CGRect {
    var r = super.clearButtonRectForBounds(bounds)
    if !isNilOrEmpty(text) {
      var top = ceil(title.font.lineHeight + hintYPadding)
      top = min(top, maxTopInset())
      r = CGRect(x:r.origin.x, y:r.origin.y + (top * 0.5), width:r.size.width, height:r.size.height)
    }
    //    return CGRectIntegral(r)
    return UIEdgeInsetsInsetRect(r, defaultPadding)
  }
  
  // MARK:- Public Methods
  
  // MARK:- Private Methods
  private func setup() {
    borderStyle = UITextBorderStyle.None
    titleActiveTextColour = tintColor
    // Set up title label
    title.alpha = 0.0
    title.font = titleFont
    title.textColor = titleTextColour
    if let str = placeholder {
      if !str.isEmpty {
        title.text = str
        title.sizeToFit()
      }
    }
    self.addSubview(title)
  }
  
  private func maxTopInset()->CGFloat {
    return max(0, floor(bounds.size.height - font!.lineHeight - 4.0))
  }
  
  private func setTitlePositionForTextAlignment() {
    let r = textRectForBounds(bounds)
    var x = r.origin.x
    if textAlignment == NSTextAlignment.Center {
      x = r.origin.x + (r.size.width * 0.5) - title.frame.size.width
    } else if textAlignment == NSTextAlignment.Right {
      x = r.origin.x + r.size.width - title.frame.size.width
    }
    title.frame = CGRect(x:x, y:title.frame.origin.y, width:title.frame.size.width, height:title.frame.size.height)
  }
  
  private func showTitle(animated:Bool) {
    let dur = animated ? animationDuration : 0
    UIView.animateWithDuration(dur, delay:0, options: [.BeginFromCurrentState,.CurveEaseOut], animations:{
      // Animation
      self.title.alpha = 1.0
      var r = self.title.frame
      r.origin.y = self.titleYPadding
      self.title.frame = r
      }, completion:nil)
  }
  
  private func hideTitle(animated:Bool) {
    let dur = animated ? animationDuration : 0
    UIView.animateWithDuration(dur, delay:0, options: [.BeginFromCurrentState,.CurveEaseIn], animations:{
      // Animation
      self.title.alpha = 0.0
      var r = self.title.frame
      r.origin.y = self.title.font.lineHeight + self.hintYPadding
      self.title.frame = r
      }, completion:nil)
  }
}