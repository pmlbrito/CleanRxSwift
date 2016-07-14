//
//  CRXUserDefaults.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 30/06/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import SwiftyUserDefaults

public class CRXPreferencesConstants {
  static let ONBOARDING_USER_DONE = "onboarding_user_done";

}


extension DefaultsKeys {
  static let onboarding_user_done = DefaultsKey<Bool>(CRXPreferencesConstants.ONBOARDING_USER_DONE)
}


class CRXUserDefaultsService {
  static func isUserOnboardingDone() -> Bool {
    return Defaults[.onboarding_user_done];
  }
  
  static func setUserOnboardingDone(isDone: Bool) -> Bool {
    Defaults[.onboarding_user_done] = isDone;
    return true;
  }
}
