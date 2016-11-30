//
//  CRXUserDefaults.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 30/06/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import SwiftyUserDefaults

open class CRXPreferencesConstants {
  static let OnboardingUserDone = "onboarding_user_done"
}


extension DefaultsKeys {
  static let onboardingUserDone = DefaultsKey<Bool>(CRXPreferencesConstants.OnboardingUserDone)
}


class CRXUserDefaultsService {
  
  static func isUserOnboardingDone() -> Bool {
    return Defaults[.onboardingUserDone]
  }
  
  static func setUserOnboardingDone(isDone: Bool) -> Bool {
    Defaults[.onboardingUserDone] = isDone
    return true
  }
  
}
