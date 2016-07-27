//
//  CRXOnBoardingModels.swift
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

enum CRXOnBoardingDestination: String {
  case InApp
}

struct CRXOnBoardingRequest
{
}

struct CRXOnBoardingResponse
{
  var sliderContent: [CRXOnBoardingContent];
  
  var destination: CRXOnBoardingDestination?
  var transitionType: ViewControllerPresentationType?
}

struct CRXOnBoardingViewModel
{
  var sliderItems: [CRXOnBoardingPageBaseViewController]?;
  
  var destination: CRXOnBoardingDestination?
  var transitionType: ViewControllerPresentationType?
  
//  var error: CRXErrorModel?
}