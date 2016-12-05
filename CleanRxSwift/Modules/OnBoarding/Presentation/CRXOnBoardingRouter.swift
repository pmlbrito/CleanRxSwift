//
//  CRXOnBoardingRouter.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 01/07/16.
//  Copyright (c) 2016 pedroml.brito. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import QuickShotUtils

protocol CRXOnBoardingRouterInput {
}

class CRXOnBoardingRouter: CRXOnBoardingRouterInput {
  var viewController: CRXOnBoardingViewController!
  
  init(viewController: CRXOnBoardingViewController!) {
    self.viewController = viewController
  }

  
  // MARK: Navigation
  func navigateToNextScreen(_ destination: CRXOnBoardingDestination?, transitionType: ViewControllerPresentationType?) {
    var destinationViewController: UIViewController? = nil
    
    if let dest = destination {
      switch dest {
      case .inApp:
        // TODO: change this
        destinationViewController = CRXOnBoardingSetup.container.resolve(CRXOnBoardingViewController.self)
        break
      }
    }
    
    viewController.transtitionToNextViewController(fromViewController: viewController, destinationViewController: destinationViewController, transitionType: transitionType)
  }
  
}
