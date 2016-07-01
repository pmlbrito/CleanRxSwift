//
//  CRXOnBoardingPageBaseViewController.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 01/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import UIKit
//import SwiftEventBus

public enum RFOnboardingEvents: String {
  case FINISH = "finish_button_click"
}

struct CRXOnBoardingContent
{
  var titleText : String!
  var descriptionText : String!
  var imageName : String!
  var bgColor: UIColor?
}

class CRXOnBoardingPageBaseViewController: CRXBaseViewController {
  
  lazy var headingContainer = UIView();
  lazy var headingLabel = UILabel();
  lazy var descriptionContainer = UIView();
  lazy var descriptionLabel = UILabel();
  lazy var imageContainer = UIView();
  lazy var contentImageView = UIInputView();
  lazy var stepFinishButton = UIButton();
  
  var pageIndex: Int?
  var isFinalStep: Bool!
  
  var pageContent: CRXOnBoardingContent!;
  
  
  // MARK: Object lifecycle
  override init() {
    super.init();
    self.isFinalStep = false;
  }
  
  required convenience init(coder: NSCoder) {
    self.init(coder: coder);
  }
  
  // MARK: ViewController lifecycle events
  override func viewDidLoad() {
    super.viewDidLoad();
    displayPageContent();
  }
  
  
  //TODO: build page content layout
  func displayPageContent(){
    
    self.view.backgroundColor = self.pageContent.bgColor != nil ? self.pageContent.bgColor! : UIColor.whiteColor();
    
//    self.headingContainer = UIView.newAutoLayoutView();
//    //    self.headingContainer.backgroundColor = UIColor.randomColor();
//    self.view.addSubview(headingContainer);
//    
//    self.headingLabel = RFViewFactory.sharedInstance.headingTitleLabelWithText(pageContent.titleText.uppercaseString, textColor: RFColorScheme.rf_orange);
//    self.headingContainer.addSubview(self.headingLabel);
//    
//    self.descriptionContainer = UIView.newAutoLayoutView();
//    //    descriptionContainer.backgroundColor = UIColor.randomColor();
//    self.view.addSubview(descriptionContainer);
//    
//    self.descriptionLabel = RFViewFactory.sharedInstance.headingTitleLabelForSizeWithText(pageContent.descriptionText, fontSize: RFUIDimensions.fontSize16 ,textColor: RFColorScheme.greyBlue);
//    //    descriptionLabel.backgroundColor = UIColor.randomColor();
//    self.descriptionContainer.addSubview(self.descriptionLabel);
//    //     self.view.addSubview(self.descriptionLabel);
//    
//    self.imageContainer = UIView.newAutoLayoutView();
//    //    self.imageContainer.backgroundColor = UIColor.randomColor();
//    self.view.addSubview(imageContainer)
//    
//    self.contentImageView = UIImageView.newAutoLayoutView();
//    self.contentImageView.image = UIImage(named: pageContent.imageName!);
//    self.contentImageView.contentMode = .ScaleAspectFit;
//    self.contentImageView.clipsToBounds = true;
//    self.imageContainer.addSubview(self.contentImageView);
//    
//    //prepare animation
//    self.headingContainer.alpha = 0.1;
//    self.descriptionContainer.alpha = 0.1;
//    self.imageContainer.alpha = 0.1;
//    UIView.animateWithDuration(1.0, animations: { () -> Void in
//      self.headingContainer.alpha = 1.0;
//      self.descriptionContainer.alpha = 1.0;
//      self.imageContainer.alpha = 1.0;
//    });
//    
//    if(self.isFinalStep != nil && self.isFinalStep == true){
//      stepFinishButton = RFViewFactory.sharedInstance.circularButtonImage(UIImage(named:"ic_check_white")!, highlightedButtonImage: UIImage(named:"ic_check_primary")!, buttonColor: RFColorScheme.primary!, highlightedButtonColor: RFColorScheme.white);
//      stepFinishButton.center.x = self.view.frame.width - 60.0;
//      stepFinishButton.center.y = self.view.frame.height - 60.0;
//      stepFinishButton.addTarget(self, action: #selector(RFOnBoardingPageContentBaseViewController.doOnboardingFinishEventNotification(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//      self.view.addSubview(stepFinishButton);
//    }
//    
//    self.view.setNeedsUpdateConstraints(); // bootstrap Auto Layout
  }
  
//  override func updateViewConstraints() {
//    if(!self.didSetupConstraints){
//      
//      self.layoutSubviews();
//      
//      self.didSetupConstraints = true;
//    }
//    super.updateViewConstraints();
//  }
  
  
  //TODO: layout constraints snapkit
  func layoutSubviews() {
//    let headingTopPadding = CGFloat(20.0);
//    let headingSidePadding = CGFloat(30.0);
//    let headingTextTopPadding = CGFloat(10.0);
    
    //setup inner views
//    self.headingContainer.autoPinToTopLayoutGuideOfViewController(self, withInset: headingTopPadding);
//    headingContainer.autoPinEdgeToSuperviewEdge(.Leading, withInset: headingSidePadding);
//    headingContainer.autoPinEdgeToSuperviewEdge(.Trailing, withInset: headingSidePadding);
//    headingContainer.autoSetDimension(.Height, toSize: 40.0);
//    
//    //Prevent the headingTitle from compressing smaller than required to fit its single line of text
//    headingLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: .Vertical)
//    
//    //Position the single-line headingTitle at the top of the screen spanning the width, with some small insets
//    headingLabel.autoPinEdgeToSuperviewEdge(.Top);
//    headingLabel.autoPinEdgeToSuperviewEdge(.Leading);
//    headingLabel.autoPinEdgeToSuperviewEdge(.Trailing);
//    headingLabel.autoPinEdgeToSuperviewEdge(.Bottom);
//    
//    //Position the image below the title, spanning the width of the screen with some small insets
//    imageContainer.autoPinEdge(.Top, toEdge: .Bottom, ofView: headingContainer, withOffset: headingTopPadding);
//    imageContainer.autoPinEdgeToSuperviewEdge(.Leading, withInset: headingSidePadding);
//    imageContainer.autoPinEdgeToSuperviewEdge(.Trailing, withInset: headingSidePadding);
//    imageContainer.autoMatchDimension(.Height, toDimension: .Height, ofView: self.view, withMultiplier: 0.45);
//    
//    contentImageView.autoAlignAxis(.Vertical, toSameAxisOfView: self.imageContainer);
//    contentImageView.autoAlignAxis(.Horizontal, toSameAxisOfView: self.imageContainer);
//    contentImageView.autoPinEdgesToSuperviewEdges()
//    
//    self.descriptionContainer.autoPinEdge(.Top, toEdge: .Bottom, ofView: self.imageContainer, withOffset: headingTextTopPadding);
//    descriptionContainer.autoPinEdgeToSuperviewEdge(.Leading, withInset: headingSidePadding);
//    descriptionContainer.autoPinEdgeToSuperviewEdge(.Trailing, withInset: headingSidePadding);
//    descriptionContainer.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 40.0);
//    
//    //Position the multi-line headingTexte below the image, spanning the width of the screen with some small insets
//    self.descriptionLabel.autoPinEdge(.Top, toEdge: .Top, ofView: self.descriptionContainer)
//    self.descriptionLabel.autoPinEdgeToSuperviewEdge(.Leading);
//    self.descriptionLabel.autoPinEdgeToSuperviewEdge(.Trailing);
//    //    descriptionLabel.autoMatchDimension(.Height, toDimension: .Height, ofView: self.descriptionContainer);
//    //    descriptionLabel.autoCenterInSuperview();
//    descriptionLabel.autoAlignAxis(.Vertical, toSameAxisOfView: self.descriptionContainer);
    
  }
  
  
  // MARK: Event handling
  func doOnboardingFinishEventNotification(sender:UIButton!) {
    //TODO: notify anyone interested
//    SwiftEventBus.post(RFOnboardingEvents.FINISH.rawValue);
  }
}
