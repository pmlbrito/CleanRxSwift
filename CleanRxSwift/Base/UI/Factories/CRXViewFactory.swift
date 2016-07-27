//
//  CRXViewFactory.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 01/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import UIKit


class CRXViewFactory {

  //MARK: UIButton
  
  static func circularButtonImage(buttonImage:UIImage, highlightedButtonImage:UIImage, buttonColor: UIColor, highlightedButtonColor: UIColor) -> UIButton {
    let button = UIButton(frame:CGRectMake(0.0, 0.0, 56.0, 56.0));
    
    button.setBackgroundColor(buttonColor, forState: UIControlState.Normal);
    button.setBackgroundColor(highlightedButtonColor, forState: UIControlState.Highlighted);
    button.setBackgroundColor(highlightedButtonColor, forState: UIControlState.Selected);
    
    button.setImage(buttonImage, forState: UIControlState.Normal)
    button.setImage(highlightedButtonImage, forState: UIControlState.Highlighted)
    button.setImage(highlightedButtonImage, forState: UIControlState.Selected)
    
    button.layer.cornerRadius = 0.5 * button.bounds.size.width
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = UIColor(hexString: "#E3E3E3FF")!.CGColor;
    button.clipsToBounds = true
    
    return button;
  }

//  
//  func buttonWithTitle(buttonTitle: NSString, normalImage: UIImage, highlightedImage: UIImage?, normalColor: UIColor, highlightedColor: UIColor) -> UIButton {
//    let button = UIButton(frame:CGRectMake(0.0, 0.0, normalImage.size.width, normalImage.size.height));
//    
//    button.setBackgroundImage(normalImage, forState: UIControlState.Normal);
//    button.setTitle(buttonTitle as String, forState: UIControlState.Normal);
//    
//    if (highlightedImage != nil) {
//      button.setBackgroundImage(highlightedImage, forState: UIControlState.Highlighted);
//      button.setBackgroundImage(highlightedImage, forState: UIControlState.Selected);
//    }
//    
//    button.setTitleColor(normalColor, forState: UIControlState.Normal);
//    button.setTitleColor(highlightedColor, forState: UIControlState.Selected);
//    button.setTitleColor(highlightedColor, forState: UIControlState.Highlighted);
//    
//    return button;
//  }
//  
//  func buttonWithTitle(buttonTitle: NSString, textColor: UIColor, highlightedTextColor: UIColor, buttonColor: UIColor, highlightedButtonColor: UIColor) -> UIButton {
//    return buttonWithTitleWithFontSize(buttonTitle, fontSize: 18, textColor: textColor, highlightedTextColor: highlightedTextColor,
//                                       buttonColor: buttonColor, highlightedButtonColor: highlightedButtonColor);
//  }
//  
//  
//  func buttonWithTitleWithFontSize(buttonTitle: NSString, fontSize: CGFloat, textColor: UIColor, highlightedTextColor: UIColor?, buttonColor: UIColor, highlightedButtonColor: UIColor?) -> UIButton {
//    
//    let button = UIButton.newAutoLayoutView();
//    button.setTitle((buttonTitle as String).uppercaseString, forState: UIControlState.Normal);
//    button.titleLabel!.font = UIFont.boldSystemFontOfSize(fontSize);
//    
//    button.setTitleColor(textColor, forState: UIControlState.Normal);
//    button.setTitleColor(RFColorScheme.placeholderText, forState: .Disabled);
//    
//    if(highlightedTextColor != nil){
//      button.setTitleColor(highlightedTextColor, forState: UIControlState.Highlighted);
//      button.setTitleColor(highlightedTextColor, forState: UIControlState.Selected);
//    }
//    
//    
//    button.setBackgroundColor(buttonColor, forState: UIControlState.Normal);
//    button.setBackgroundColor(RFColorScheme.paleGrey, forState: .Disabled);
//    if(highlightedButtonColor != nil){
//      button.setBackgroundColor(highlightedButtonColor!, forState: UIControlState.Highlighted);
//      button.setBackgroundColor(highlightedButtonColor!, forState: UIControlState.Selected);
//    }
//    
//    
//    return button;
//  }
//  
//  
//  func buttonWithTitleAndImage(buttonTitle: NSString, buttonImage:NSString, textColor: UIColor, highlightedTextColor: UIColor, buttonColor: UIColor, highlightedButtonColor: UIColor) -> UIButton {
//    
//    let button = UIButton.newAutoLayoutView();
//    button.setTitle((buttonTitle as String).uppercaseString, forState: UIControlState.Normal);
//    button.titleLabel!.font = UIFont.systemFontOfSize(18);
//    
//    button.setTitleColor(textColor, forState: UIControlState.Normal);
//    button.setTitleColor(highlightedTextColor, forState: UIControlState.Highlighted);
//    button.setTitleColor(highlightedTextColor, forState: UIControlState.Selected);
//    
//    button.setBackgroundColor(buttonColor, forState: UIControlState.Normal);
//    button.setBackgroundColor(highlightedButtonColor, forState: UIControlState.Highlighted);
//    button.setBackgroundColor(highlightedButtonColor, forState: UIControlState.Selected);
//    
//    button.setImage(UIImage(named: buttonImage as String), forState: UIControlState.Normal);
//    button.setImage(UIImage(named: buttonImage as String), forState: UIControlState.Highlighted);
//    button.setImage(UIImage(named: buttonImage as String), forState: UIControlState.Selected);
//    
//    return button;
//  }
//  
//  
//  func socialLoginButtonWithTitleAndImage(buttonTitle: NSString, buttonImage:NSString, textColor: UIColor, highlightedTextColor: UIColor, buttonColor: UIColor, highlightedButtonColor: UIColor) -> UIButton {
//    
//    let button = UIButton.newAutoLayoutView();
//    button.setTitle((buttonTitle as String).uppercaseString, forState: UIControlState.Normal);
//    button.titleLabel!.font = UIFont.systemFontOfSize(13);
//    
//    button.titleEdgeInsets = UIEdgeInsets(top: 0, left:-30, bottom: 0, right: 10)
//    
//    button.setTitleColor(textColor, forState: UIControlState.Normal);
//    button.setTitleColor(highlightedTextColor, forState: UIControlState.Highlighted);
//    button.setTitleColor(highlightedTextColor, forState: UIControlState.Selected);
//    
//    button.setBackgroundColor(buttonColor, forState: UIControlState.Normal);
//    button.setBackgroundColor(highlightedButtonColor, forState: UIControlState.Highlighted);
//    button.setBackgroundColor(highlightedButtonColor, forState: UIControlState.Selected);
//    
//    button.setImage(UIImage(named: buttonImage as String), forState: UIControlState.Normal);
//    button.setImage(UIImage(named: buttonImage as String), forState: UIControlState.Highlighted);
//    button.setImage(UIImage(named: buttonImage as String), forState: UIControlState.Selected);
//    
//    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
//    
//    return button;
//  }
//  
//  
//  func circularButtonImage(buttonImage:UIImage, highlightedButtonImage:UIImage, buttonColor: UIColor, highlightedButtonColor: UIColor) -> UIButton {
//    let button = UIButton(frame:CGRectMake(0.0, 0.0, 56.0, 56.0));
//    
//    button.setBackgroundColor(buttonColor, forState: UIControlState.Normal);
//    button.setBackgroundColor(highlightedButtonColor, forState: UIControlState.Highlighted);
//    button.setBackgroundColor(highlightedButtonColor, forState: UIControlState.Selected);
//    
//    button.setImage(buttonImage, forState: UIControlState.Normal)
//    button.setImage(highlightedButtonImage, forState: UIControlState.Highlighted)
//    button.setImage(highlightedButtonImage, forState: UIControlState.Selected)
//    
//    button.layer.cornerRadius = 0.5 * button.bounds.size.width
//    button.layer.borderWidth = 1.0;
//    button.layer.borderColor = RFColorScheme.background_light_grey!.CGColor;
//    button.clipsToBounds = true
//    
//    return button;
//  }
//  
//  
//  //MARK: UITextfield
//  func textfieldForFormsWithPlaceholderText(text: NSString) -> UITextField {
//    let textField = UITextField(frame: CGRectZero)
//    textField.attributedPlaceholder = NSAttributedString(string:text as String,
//                                                         attributes:[NSForegroundColorAttributeName: RFColorScheme.placeholderText!])
//    textField.textColor = RFColorScheme.text;
//    textField.font = UIFont.systemFontOfSize(16.0);
//    textField.clipsToBounds = false
//    textField.backgroundColor = RFColorScheme.clear
//    return textField;
//  }
//  
//  
//  func labelForFormsPickerWithText(text: NSString) -> UILabel {
//    let label = UILabel.newAutoLayoutView()
//    label.text = text as String;
//    label.textColor = RFColorScheme.placeholderText;
//    label.font = UIFont.systemFontOfSize(16.0);
//    label.clipsToBounds = false
//    return label;
//  }
//  
//  
//  
//  func loginTextfieldWithPlaceholderText(text: NSString, textColor: UIColor, backgroundColor: UIColor, borderColor: UIColor, hintTintColor: UIColor, errorColor: UIColor) -> RFLoginTextField {
//    let textField = RFLoginTextField.newAutoLayoutView();
//    
//    //placeholder
//    textField.attributedPlaceholder = NSAttributedString(string:text as String, attributes:[NSForegroundColorAttributeName: textColor]);
//    
//    //float label
//    textField.titleTextColour = hintTintColor;
//    textField.titleActiveTextColour = hintTintColor;
//    textField.titleYPadding = 13;
//    
//    //text
//    textField.textColor = textColor;
//    textField.backgroundColor = backgroundColor;
//    textField.font = UIFont.systemFontOfSize(18);
//    
//    
//    //border
//    textField.layer.masksToBounds = true
//    textField.borderColor = borderColor;
//    textField.layer.borderColor = borderColor.CGColor
//    textField.layer.borderWidth = 2.0
//    
//    textField.errorColor = errorColor;
//    
//    return textField;
//  }
//  
  
  //MARK: UILabel
//  func labelWithTextCenteredAndSize(labelText: NSString, textColor: UIColor, fontSize: CGFloat) -> UILabel {
//    let label = UILabel.newAutoLayoutView();
//    label.text = labelText as String;
//    label.textColor = textColor;
//    label.textAlignment = NSTextAlignment.Center;
//    label.numberOfLines = 1;
//    label.lineBreakMode = .ByWordWrapping;
//    label.font = UIFont.systemFontOfSize(fontSize);
//    
//    label.sizeToFit()
//    
//    return label;
//  }
  
  static func boldLabelWithTextAndSize(labelText: NSString, textColor: UIColor, fontSize: CGFloat) -> UILabel {
    let label = UILabel();
    label.text = labelText as String;
    label.textColor = textColor;
    label.textAlignment = NSTextAlignment.Center;
    label.numberOfLines = 1;
    label.lineBreakMode = .ByWordWrapping;
    label.font = UIFont.boldSystemFontOfSize(fontSize);
    
    label.sizeToFit()
    
    return label;
  }
  
  static func textLabelWithTextAndSize(labelText: NSString, textColor: UIColor, fontSize: CGFloat) -> UILabel {
    let label = UILabel();
    label.text = labelText as String;
    label.textColor = textColor;
    label.textAlignment = NSTextAlignment.Center;
    label.numberOfLines = 0;
    label.lineBreakMode = .ByWordWrapping;
    label.font = UIFont.systemFontOfSize(fontSize);
    
    label.sizeToFit()
    
    return label;
  }
  
//  func labelWithTextAndSize(labelText: NSString, textColor: UIColor, fontSize: CGFloat) -> UILabel {
//    let label = UILabel.newAutoLayoutView();
//    label.text = labelText as String;
//    label.textColor = textColor;
//    label.textAlignment = NSTextAlignment.Left;
//    label.numberOfLines = 1;
//    label.lineBreakMode = .ByWordWrapping;
//    label.font = UIFont.systemFontOfSize(fontSize);
//    
//    label.sizeToFit()
//    
//    return label;
//  }
  
  
//  
//  func headingTitleLabelWithText(labelText: NSString, textColor: UIColor) -> UILabel {
//    let label = UILabel.newAutoLayoutView();
//    label.text = labelText as String;
//    label.textColor = textColor;
//    label.textAlignment = NSTextAlignment.Center;
//    label.numberOfLines = 0;
//    label.lineBreakMode = .ByWordWrapping;
//    label.font = UIFont.systemFontOfSize(24);
//    
//    label.sizeToFit()
//    
//    return label;
//  }
//  
//  func headingTitleLabelForSizeWithText(labelText: NSString, fontSize: CGFloat, textColor: UIColor) -> UILabel {
//    let label = UILabel.newAutoLayoutView();
//    label.text = labelText as String;
//    label.textColor = textColor;
//    label.textAlignment = NSTextAlignment.Center;
//    label.numberOfLines = 0;
//    label.lineBreakMode = .ByWordWrapping;
//    label.font = UIFont.systemFontOfSize(fontSize);
//    
//    label.sizeToFit()
//    
//    return label;
//  }
  
  
  static func errorLabelWithText(labelText: NSString, textColor: UIColor) -> UILabel {
    let label = UILabel();
    label.text = labelText as String;
    label.textColor = textColor;
    label.textAlignment = NSTextAlignment.Left;
    label.numberOfLines = 0;
    label.lineBreakMode = .ByWordWrapping;
    label.font = UIFont.systemFontOfSize(10);
    
    label.sizeToFit()
    
    return label;
  }
  
  
  static func labelWithAttributedText(labelText: NSString, fontSize: CGFloat, textColor: UIColor) -> UILabel {
    let label = UILabel();
    label.font = UIFont.systemFontOfSize(fontSize);
    let style = NSMutableParagraphStyle()
    style.lineBreakMode = NSLineBreakMode.ByWordWrapping
    let attributes = [NSFontAttributeName: label.font, NSParagraphStyleAttributeName: style]
    let attributedString = NSMutableAttributedString(string: labelText as String, attributes: attributes)
    label.attributedText = attributedString
    
    label.textColor = textColor;
    label.textAlignment = NSTextAlignment.Center;
    label.numberOfLines = 0;
    label.lineBreakMode = .ByWordWrapping;
    
    label.sizeToFit()
    
    return label;
  }
  
  
  // MARK: Pickers
//  func datePickerForSimpleDate(viewWidth : CGFloat) -> UIDatePicker {
//    let datePicker = UIDatePicker()
//    datePicker.datePickerMode = .Date
//    datePicker.backgroundColor = RFColorScheme.background_light_grey
//    datePicker.width = viewWidth
//    return datePicker
//  }
  
  //MARK: UIImageView
//  func imageviewWithNameAndPlacement(imageName: NSString, centerX: CGFloat, centerY: CGFloat) -> UIImageView {
//    
//    let image = UIImage(named: imageName as String);
//    let imgView = UIImageView(image: image!);
//    imgView.frame = CGRect(x: 0, y: 0, width: (image?.size.width)!, height: (image?.size.height)!);
//    imgView.center.x = centerX;
//    imgView.center.y = centerY;
//    
//    return imgView;
//  }
  
  //MARK: - SegmentedControls
//  func segmentedControlForTableView(items : [String]) -> UISegmentedControl {
//    let control = UISegmentedControl(items: items)
//    control.tintColor = RFColorScheme.text
//    control.height = RFUIDimensions.tableRowHeight/2
//    control.setTitleTextAttributes([NSFontAttributeName : UIFont.systemFontOfSize(14.0)], forState: .Normal)
//    return control
//  }
  
  
  static func roundViewCorners(view: UIView, corners: UIRectCorner, radius: CGFloat){
    let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.CGPath
    view.layer.mask = mask
    view.layer.masksToBounds = true
  }
}
