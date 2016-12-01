//
//  CRXSplashSetup.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 02/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation
import Swinject

class CRXSplashSetup {
  
  static let container = Container()
  
  static func setup() {
    
    container.register(CRXSplashViewController.self) { injector in
      let controller = CRXSplashViewController()
      controller.presenter = CRXSplashSetup.container.resolve(CRXSplashPresenter.self)!
      return controller
    }.initCompleted { injector, splash in
      let router = CRXSplashSetup.container.resolve(CRXSplashRouter.self)!
      splash.router = router
    }
    
    container.register(CRXSplashInteractor.self) { injector in
      CRXSplashInteractor(process: injector.resolve(CRXSplashProcess.self)!)
    }
    
    container.register(CRXSplashPresenter.self) { injector in
      CRXSplashPresenter(interactor: injector.resolve(CRXSplashInteractor.self)!)
    }
    
    container.register(CRXSplashProcess.self) { injector in
      CRXSplashProcess()
    }
    
    container.register(CRXSplashRouter.self) { injector in
      CRXSplashRouter(viewController: injector.resolve(CRXSplashViewController.self)!)
    }
  }
  
}
