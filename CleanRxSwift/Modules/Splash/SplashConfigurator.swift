//
//  SplashConfigurator.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 22/06/16.
//  Copyright (c) 2016 pedroml.brito. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import QuickShotUtils

// MARK: Connect View, Interactor, and Presenter

extension SplashViewController: SplashPresenterOutput
{
}

extension SplashInteractor: SplashViewControllerOutput
{
}

extension SplashPresenter: SplashInteractorOutput
{
}

class SplashConfigurator
{
  // MARK: Object lifecycle
  
  class var sharedInstance: SplashConfigurator
  {
    struct Static {
      static var instance: SplashConfigurator?
      static var token: dispatch_once_t = 0
    }
    
    dispatch_once(&Static.token) {
      Static.instance = SplashConfigurator()
    }
    
    return Static.instance!
  }
  
  // MARK: Configuration
  
  func configure(viewController: SplashViewController)
  {
    let router = SplashRouter()
    router.viewController = viewController
    
    let interactor = SplashInteractor()
    
    let presenter = SplashPresenter(interactor: interactor);
    presenter.output = viewController
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
