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
import RxSwift
import QuickShotUtils;

protocol CRXOnBoardingPresenterProtocol: CRXPresenterProtocol
{
  func userIsDoneWithOnBoarding()
  
  func processOnBoardingPagesContent(content: [CRXOnBoardingContent])
}


class CRXOnBoardingPresenter: CRXOnBoardingPresenterProtocol
{
  weak var view: CRXOnBoardingViewController!
  
  weak var interactor: CRXOnBoardingInteractor!;
  
  var disposeBag = DisposeBag()
  var contentLoadSubscription: Disposable!
  
  var userIsDoneSubscription: Disposable!
  
  init(interactor: CRXOnBoardingInteractor){
    self.interactor = interactor
    contentLoadSubscription = self.interactor.getSlides().observeOn(MainScheduler.instance).subscribeNext({ slides in
      self.processOnBoardingPagesContent(slides);
    })
    disposeBag.addDisposable(contentLoadSubscription);
  }
  
  // MARK: Presentation logic
  func bindView(view: CRXViewProtocol){
    self.view = view as! CRXOnBoardingViewController;
  }
  
  func userIsDoneWithOnBoarding() {
    userIsDoneSubscription = self.interactor.updateUserIsDone(true).observeOn(MainScheduler.instance).subscribeNext({ success in
      var onBoardingResultModel = CRXOnBoardingViewModel();
      onBoardingResultModel.destination = CRXOnBoardingDestination.InApp;
      onBoardingResultModel.transitionType = ViewControllerPresentationType.ReplaceAtRoot
  
      self.view.userFinishedOnBoarding(onBoardingResultModel);
    })
    disposeBag.addDisposable(contentLoadSubscription);
  }
  
  func processOnBoardingPagesContent(content: [CRXOnBoardingContent]){
    //create page content controllers from content
    var sliderPages = [CRXOnBoardingPageBaseViewController]();
    
    var itemIdx = Int(-1);
    
    for iter in content {
      itemIdx += 1;
      let item = CRXOnBoardingPageBaseViewController();
      item.pageContent = iter;
      item.pageIndex = itemIdx;
      
      sliderPages.append(item);
    }
    
    sliderPages.last!.isFinalStep = true;
    
    var viewModel = CRXOnBoardingViewModel();
    viewModel.sliderItems = sliderPages
    self.view.displayOnboardingPages(viewModel)
  }
}