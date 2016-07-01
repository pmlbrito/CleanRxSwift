//
//  CRXSplashProcess.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 22/06/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation
import RxSwift

class CRXSplashProcess {
  
  //apply delay before responding
  
  func checkIfOnboardingIsDone() -> Observable<Bool> {
    let onboardingDone = CRXUserDefaults.isUserOnboardingDone();
    return Observable.just(onboardingDone);
  }
}
