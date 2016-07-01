//
//  CRXOnBoardingPresenter.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 01/07/16.
//  Copyright (c) 2016 pedroml.brito. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CRXOnBoardingPresenterInput
{
  func presentSomething(response: CRXOnBoardingResponse)
}

protocol CRXOnBoardingPresenterOutput: class
{
  func displaySomething(viewModel: CRXOnBoardingViewModel)
}

class CRXOnBoardingPresenter: CRXOnBoardingPresenterInput
{
  weak var output: CRXOnBoardingPresenterOutput!
  
  // MARK: Presentation logic
  
  func presentSomething(response: CRXOnBoardingResponse)
  {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    
    let viewModel = CRXOnBoardingViewModel()
    output.displaySomething(viewModel)
  }
}