//
//  CRXOnBoardingPagerViewController.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 01/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation
import UIKit


struct CRXPagerConfig {
  let bounces: Bool
  let defaultSlide: Int
  let showDefaultPageIndicator: Bool
  let sendDefaultSlideChange: Bool
  
  init(bounces: Bool, defaultSlide: Int, showDefaultPageIndicator: Bool, sendDefaultSlideChange: Bool = false) {
    self.bounces = bounces
    self.defaultSlide = defaultSlide
    self.showDefaultPageIndicator = showDefaultPageIndicator
    self.sendDefaultSlideChange = sendDefaultSlideChange
  }
}

class RFPagerViewController: UIPageViewController, UIPageViewControllerDataSource, UIScrollViewDelegate {
  var sliderConfig: CRXPagerConfig? {
    didSet {
      _currentSlide = sliderConfig!.defaultSlide
    }
  }
  
  var sliderContent = [CRXOnBoardingPageBaseViewController]();
  
  private var _currentSlide: Int = 0
  var currentSlide: Int {
    return _currentSlide
  }
  
  private var _applyControllerCallback: (Int -> UIViewController)?
  private var _didChangedSlideCallback: (Int -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource = self
    (view.subviews.first as? UIScrollView)?.delegate = self
    
    view.backgroundColor = UIColor.clearColor();
    
    //if we need to style the pager indicator, do it below
    let pageControl = UIPageControl.appearance()
    pageControl.pageIndicatorTintColor = UIColor.blackColor().colorWithAlphaComponent(0.45);
    pageControl.currentPageIndicatorTintColor = UIColor.blackColor();
    //    pageControl.backgroundColor = UIColor.yellowColor();
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    setViewControllers([viewControllerAtIndex(currentSlide)], direction: .Forward, animated: true, completion: nil)
    
    if sliderConfig?.sendDefaultSlideChange == true {
      _didChangedSlideCallback?(_currentSlide)
    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let subViews: NSArray = view.subviews
    var scrollView: UIScrollView? = nil
    var pageControl: UIPageControl? = nil
    
    for view in subViews {
      if view.isKindOfClass(UIScrollView) {
        scrollView = view as? UIScrollView
      }
      else if view.isKindOfClass(UIPageControl) {
        pageControl = view as? UIPageControl
      }
    }
    
    if (scrollView != nil && pageControl != nil) {
      scrollView?.frame = view.bounds
      view.bringSubviewToFront(pageControl!)
    }
  }
  
  // *** METHODS
  // * FUNCTIONS
  func applyController(callback: Int -> UIViewController) {
    _applyControllerCallback = callback
  }
  
  func didChangedSlide(callback: Int -> Void) {
    _didChangedSlideCallback = callback
  }
  
  // PRIVATE
  private func viewControllerAtIndex(contentIndex: Int?) -> UIViewController! {
    guard let vcIndex = contentIndex else { return nil }
    
    let viewController: UIViewController
    if let callback = _applyControllerCallback {
      viewController = callback(vcIndex)
    }
    else {
      viewController = sliderContent[vcIndex];
    }
    
    return viewController
  }
  
  private func getControllerIndex(vc: UIViewController) -> Int {
    let vcCast = vc as! CRXOnBoardingPageBaseViewController;
    
    return vcCast.pageIndex!;
  }
  
  // * DELEGATES
  // UIPageViewControllerDataSource
  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    return sliderConfig?.showDefaultPageIndicator == false ? 1 : sliderContent.count
  }
  
  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    return currentSlide
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    let vcCast = viewController as! CRXOnBoardingPageBaseViewController;
    var vcIndex = vcCast.pageIndex! as Int;
    
    if(vcIndex == 0 || vcIndex == NSNotFound){
      return nil;
    }
    
    vcIndex -= 1;
    return self.viewControllerAtIndex(vcIndex);
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    let vcCast = viewController as! CRXOnBoardingPageBaseViewController;
    var vcIndex = vcCast.pageIndex! as Int;
    
    if(vcIndex == NSNotFound){
      return nil;
    }
    
    vcIndex+=1;
    
    if(vcIndex == self.sliderContent.count){
      return nil;
    }
    
    return self.viewControllerAtIndex(vcIndex);
  }
  
  // UIScrollViewDelegate
  func scrollViewDidScroll(scrollView: UIScrollView) {
    scrollView.bounces = sliderConfig?.bounces ?? true
    
    guard let vc = viewControllers?[0], case let slide = getControllerIndex(vc) where slide != _currentSlide else { return }
    
    _currentSlide = slide;
    _didChangedSlideCallback?(_currentSlide)
  }
}
