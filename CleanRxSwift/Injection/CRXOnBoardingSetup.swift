//
//  CRXOnBoardingSetup.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 14/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation
import Swinject

class CRXOnBoardingSetup {
  
  static let container = Container()
  
  static func setup() {
    
    container.register(CRXOnBoardingViewController.self) { injector in
      let controller = CRXOnBoardingViewController()
      controller.presenter = CRXOnBoardingSetup.container.resolve(CRXOnBoardingPresenter.self)!
      return controller
      }.initCompleted { injector, onboarding in
        let router = CRXOnBoardingSetup.container.resolve(CRXOnBoardingRouter.self)!
        onboarding.router = router
    }
    
    
    container.register(CRXOnBoardingPresenter.self) { injector in
      CRXOnBoardingPresenter(interactor: injector.resolve(CRXOnBoardingInteractor.self)!)
    }
    
    container.register(CRXOnBoardingInteractor.self) { injector in
      CRXOnBoardingInteractor(process: injector.resolve(CRXOnBoardingProcess.self)!)
    }
    
    container.register(CRXOnBoardingProcess.self) { injector in
      CRXOnBoardingProcess()
    }
    
    container.register(CRXOnBoardingRouter.self) { injector in
      CRXOnBoardingRouter(viewController: injector.resolve(CRXOnBoardingViewController.self)!)
    }
  }
  
}
