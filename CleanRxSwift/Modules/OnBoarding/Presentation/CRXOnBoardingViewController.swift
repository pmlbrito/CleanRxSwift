//
//  CRXOnBoardingViewController.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 01/07/16.
//  Copyright (c) 2016 pedroml.brito. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import SwiftEventBus
import QuickShotUtils

protocol CRXOnBoardingViewControllerProtocol: CRXViewProtocol
{
  func displayOnboardingPages(viewModel: CRXOnBoardingViewModel)
  
  func userFinishedOnBoarding(viewModel: CRXOnBoardingViewModel);
  
}

class CRXOnBoardingViewController: CRXBaseViewController, CRXOnBoardingViewControllerProtocol
{

  var presenter: CRXOnBoardingPresenter!
  var router: CRXOnBoardingRouter!
  
  var contentPages = [CRXOnBoardingPageBaseViewController]();
  
  // MARK: Object lifecycle
  override init() {
    super.init()
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.bindView();
  }
  
  // MARK: Event handling
  func endContentPresentationEvent(){
    self.onDonePressed();
  }
  
  // MARK: Display logic
  var pagerViewController : CRXPagerViewController!
  
  func displayOnboardingPages(viewModel: CRXOnBoardingViewModel)
  {
    self.contentPages = viewModel.sliderItems!;
    
    //we need to register the listener for the end of presentation
    //    let lastPage = self.contentPages.last;
    
    SwiftEventBus.onMainThread(self, name: CRXOnboardingEvents.FINISH.rawValue){ result in
      self.endContentPresentationEvent();
    }
    
    /* Getting the page View controller */
    pagerViewController = CRXPagerViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    pagerViewController.sliderContent = self.contentPages;
    pagerViewController.sliderConfig = CRXPagerConfig(bounces: false, defaultSlide: 0, showDefaultPageIndicator: true, sendDefaultSlideChange: true)
    
    
    pagerViewController.didChangedSlide { value in
      NSLog("current slide: %d", value);
    }
    
    self.pagerViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
    self.addChildViewController(pagerViewController)
    self.view.addSubview(pagerViewController.view)
    self.pagerViewController.didMoveToParentViewController(self)
  }
  
  //  func displayError(viewModel: OnBoardingViewModel) {
  //    //show user some kind of feedback errorw
  //    self.hideProgressIndicator();
  //
  //    if(viewModel.error != nil){
  //      switch viewModel.error!.type! {
  //      case RFErrorType.DIALOG:
  //        //this should be a critical error and we should not be able to continue
  //        if(!isNilOrEmpty(viewModel.error?.title)){
  //          RFAlertFactory.sharedInstance.showActionSheet((viewModel.error?.title)!, text: (viewModel.error?.message)!, actionsArray: nil, presentingViewController: self)
  //        }else{
  //          RFAlertFactory.sharedInstance.showAlertViewForErrorModel(viewModel.error!, presentingViewController: self);
  //        }
  //
  //        break;
  //      case RFErrorType.SNACK_BAR:
  //        //        let snackBar = RFAlertFactory.sharedInstance.createSnackBarForErrorModel(viewModel.error!, actionText: transManager.getString(RFTranslationConstants.ACTION_RETRY));
  //        //        snackBar.actionBlock = { (snackBar) -> Void in
  //        //          //action to retry
  //        //          snackBar.dismiss();
  //        //          self.showProgressIndicator();
  //        //          self.output.triggerCompetitionsLoad();
  //        //        }
  //        let snackBar = RFAlertFactory.sharedInstance.createSnackBarWithoutOptionsForErrorModel(viewModel.error!, duration: TTGSnackbarDuration.Middle);
  //        snackBar.showInViewController(self);
  //        break;
  //      default:
  //        //do nothing
  //        break;
  //      }
  //    }
  //  }
  
  func userFinishedOnBoarding(viewModel: CRXOnBoardingViewModel){
    self.hideProgressIndicator();
    self.router.navigateToNextScreen(viewModel.destination, transitionType: viewModel.transitionType);
  }
  
  
  //MARK: Handlers
  func onDonePressed(){
    self.showProgressIndicator();
    self.presenter?.userIsDoneWithOnBoarding();
  }

  func bindView() {
    self.presenter?.bindView(self);
  }
}
