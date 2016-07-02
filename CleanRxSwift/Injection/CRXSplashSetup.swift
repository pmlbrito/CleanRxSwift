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
  
  static let container = Container();
  
  static func setup() {
    
    container.register(CRXSplashViewController.self) { _ in
      let controller = CRXSplashViewController();
      controller.presenter = CRXSplashSetup.container.resolve(CRXSplashPresenter.self)!;
      return controller;
    }.initCompleted { r, splash in
      let router = CRXSplashSetup.container.resolve(CRXSplashRouter.self)!;
      splash.router = router;
    }
    
    container.register(CRXSplashInteractor.self) { r in
      CRXSplashInteractor(process: r.resolve(CRXSplashProcess.self)!);
    }
    
    container.register(CRXSplashPresenter.self) { r in
      CRXSplashPresenter(interactor: r.resolve(CRXSplashInteractor.self)!);
    }
    
    container.register(CRXSplashProcess.self) { _ in
      CRXSplashProcess();
    }
    
    container.register(CRXSplashRouter.self) { r in
      CRXSplashRouter(viewController: r.resolve(CRXSplashViewController.self)!);
    }
    
  }
}
