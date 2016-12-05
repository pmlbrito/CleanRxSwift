//
//  CRXSplashRouter.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 02/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//


import UIKit
import QuickShotUtils
import RxSwift

protocol CRXSplashRouterProtocol {
  func navigateToNextScreen(destination: CRXSplashDestination?, transitionType: ViewControllerPresentationType?)
}

class CRXSplashRouter: CRXSplashRouterProtocol {
  var viewController: CRXSplashViewController!
  
  init(viewController: CRXSplashViewController!) {
    self.viewController = viewController
  }
  
  // MARK: Navigation
  func navigateToNextScreen(destination: CRXSplashDestination?, transitionType: ViewControllerPresentationType?) {
    var destinationViewController: UIViewController? = nil
    
    if let dest = destination {
      switch dest {
      case .onBoarding:
        destinationViewController = CRXOnBoardingSetup.container.resolve(CRXOnBoardingViewController.self)
        break
      case .login:
        //        destinationViewController = CRXLoginViewController()
        break
      case .signIn:
        //        destinationViewController = CRXSignInChooserViewController();
        break
      case .inApp:
        //        destinationViewController = CRXRootViewController()
        break
      }
    }
    
    viewController.transtitionToNextViewController(fromViewController: viewController, destinationViewController: destinationViewController, transitionType: transitionType)
  }
  
}
