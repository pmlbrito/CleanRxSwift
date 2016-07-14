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
  
  static let container = Container();
  
  static func setup() {
    
    container.register(CRXOnBoardingViewController.self) { _ in
      let controller = CRXOnBoardingViewController();
      controller.presenter = CRXOnBoardingSetup.container.resolve(CRXOnBoardingPresenter.self)!;
      return controller;
      }.initCompleted { r, onboarding in
        let router = CRXOnBoardingSetup.container.resolve(CRXOnBoardingRouter.self)!;
        onboarding.router = router;
    }
    
    
    container.register(CRXOnBoardingPresenter.self) { r in
      CRXOnBoardingPresenter(interactor: r.resolve(CRXOnBoardingInteractor.self)!);
    }
    
    container.register(CRXOnBoardingInteractor.self) { r in
      CRXOnBoardingInteractor(process: r.resolve(CRXOnBoardingProcess.self)!);
    }
    
    container.register(CRXOnBoardingProcess.self) { _ in
      CRXOnBoardingProcess();
    }
    
    container.register(CRXOnBoardingRouter.self) { r in
      CRXOnBoardingRouter(viewController: r.resolve(CRXOnBoardingViewController.self)!);
    }
  }
}