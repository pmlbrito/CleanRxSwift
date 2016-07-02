//
//  CRXSplashRouter.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 02/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//


import UIKit
import QuickShotUtils

protocol CRXSplashRouterProtocol
{
  func navigateToNextScreen(destination: CRXSplashDestination?, transitionType: ViewControllerPresentationType?);
}

class CRXSplashRouter: CRXSplashRouterProtocol
{
  var _viewController: CRXSplashViewController!
  
  init(viewController: CRXSplashViewController!) {
    self._viewController = viewController;
  }
  
  // MARK: Navigation
  func navigateToNextScreen(destination: CRXSplashDestination?, transitionType: ViewControllerPresentationType?)
  {
    var destinationViewController: UIViewController? = nil
    
    if let dest = destination {
      switch(dest){
      case .OnBoarding:
        destinationViewController = CRXOnBoardingViewController();
        break;
      case .Login:
        //        destinationViewController = RFLoginViewController()
        break;
      case .SignIn:
        //        destinationViewController = RFSignInChooserViewController();
        break;
      case .InApp:
        //        destinationViewController = RFRootViewController()
        break;
      }
    }
    
    _viewController.transtitionToNextViewController(_viewController, destinationViewController: destinationViewController, transitionType: transitionType);
  }
}
