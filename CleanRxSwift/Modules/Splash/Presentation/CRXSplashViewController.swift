//
//  CRXSplashViewController.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 22/06/16.
//  Copyright (c) 2016 pedroml.brito. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import QuickShotUtils
import SnapKit

protocol CRXSplashViewControllerInput: CRXViewProtocol
{
  func finishSplashPage(viewModel: CRXSplashViewModel)
}


class CRXSplashViewController: CRXBaseViewController, CRXSplashViewControllerInput {
  var presenter: CRXSplashPresenterProtocol!
  var router: CRXSplashRouterProtocol!
  
  // MARK: Object lifecycle
  
  override init() {
    super.init()
  }
  
  // MARK: View lifecycle
  lazy var splash_title = CRXViewFactory.boldLabelWithTextAndSize(labelText: "Clean RxSwift", textColor: UIColor(hexString: "#344146FF")!, fontSize: CGFloat(24))
  lazy var box = UIView()
  lazy var imageView = UIImageView()
  
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.bindView();
    buildViewLayout()
  }
  
  // MARK: Event handling
  func buildViewLayout() {
    // NOTE: Ask the Interactor to do some work
    self.view.addSubview(self.splash_title);
    splash_title.snp.makeConstraints { make in
      make.left.equalTo(self.view).offset(20)
      make.right.equalTo(self.view).offset(-20)
      make.top.equalTo(self.view).offset(70)
    }
    
    self.view.addSubview(box)
    box.snp.makeConstraints { make in
      make.width.equalTo(self.view.width - 50)
      make.height.equalTo(self.view.height / 3)
      make.center.equalTo(self.view)
    }
    
    imageView.image = UIImage(named: "splash_logo")
    box.addSubview(imageView);
    imageView.snp.makeConstraints { make in
      make.edges.equalTo(box).inset(UIEdgeInsets.zero)
    }

    self.showProgressIndicator();
  }
  
  // MARK: Display logic
  
  func finishSplashPage(viewModel: CRXSplashViewModel) {
    self.hideProgressIndicator()
    self.router.navigateToNextScreen(viewModel.destination, transitionType: viewModel.transitionType)
  }
  
  // MARK: Helpers
  func bindView() {
    self.presenter?.bindView(view: self)
  }
  
}
