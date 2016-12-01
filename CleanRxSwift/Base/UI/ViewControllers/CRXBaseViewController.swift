//
//  CRXBaseViewController.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 22/06/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import UIKit
import QuickShotUtils

class CRXBaseViewController: QSUBaseViewController {
  
  var didSetupConstraints = false
  
  init() {
    super.init()
  }
  
  required convenience init(coder: NSCoder) {
    self.init()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.white
    
    view.setNeedsUpdateConstraints() // bootstrap autolayout
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
