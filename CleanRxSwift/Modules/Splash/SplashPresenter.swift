//
//  SplashPresenter.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 22/06/16.
//  Copyright (c) 2016 pedroml.brito. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import RxSwift
import QuickShotUtils;

protocol SplashPresenterInput
{
//  func presentSomething(response: SplashResponse)
}

protocol SplashPresenterOutput: class
{
  func displaySomething(viewModel: SplashViewModel)
}

class SplashPresenter: SplashPresenterInput
{
  weak var output: SplashPresenterOutput!
 
  weak var interactor: SplashInteractor!;
  
  var disposeBag = DisposeBag()
  var subscription: Disposable!
  
  init(interactor: SplashInteractor){
    self.interactor = interactor
    subscription = self.interactor.updateUserIsDone().observeOn(MainScheduler.instance).subscribeNext({ (result) in
      self.processOnBoardingState(result);
    })
    disposeBag.addDisposable(subscription);
  }

  
  // MARK: Presentation logic
  func presentSomething(response: SplashResponse)
  {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    
    let viewModel = SplashViewModel()
    output.displaySomething(viewModel)
    self.output.displaySomething(viewModel);
  }


  func processOnBoardingState(isDone: Bool){
    var response = SplashResponse();
    response.destination = isDone == true ? SplashDestination.InApp : SplashDestination.OnBoarding;
    response.transitionType = ViewControllerPresentationType.ReplaceAtRoot;
    
    self.presentSomething(response);
  }
}