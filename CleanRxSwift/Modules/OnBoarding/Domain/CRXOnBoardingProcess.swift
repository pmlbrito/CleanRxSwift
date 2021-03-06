//
//  CRXOnBoardingProcess.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 14/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation
import RxSwift

class CRXOnBoardingProcess {
  
  func updateUserOnboardingIsDone(isDone: Bool) -> Observable<Bool> {
    return Observable.just(self.applyUserOnboardingIsDone(isDone));
  }
  
  private func applyUserOnboardingIsDone(isDone: Bool) -> Bool {
    let result = CRXUserDefaultsService.setUserOnboardingDone(isDone);
    return result;
  }
}
