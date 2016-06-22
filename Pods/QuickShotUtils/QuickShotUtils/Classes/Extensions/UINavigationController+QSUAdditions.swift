//
//  UINavigationController+QSUAdditions.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import UIKit

public extension UINavigationController {
  func pushViewController(viewController: UIViewController, animated: Bool, completion: () -> ()) {
    pushViewController(viewController, animated: animated)
    
    if let coordinator = transitionCoordinator() where animated {
      coordinator.animateAlongsideTransition(nil) { _ in
        completion()
      }
    } else {
      completion()
    }
  }
  
  func popViewController(animated: Bool, completion: () -> ()) {
    popViewControllerAnimated(animated)
    
    if let coordinator = transitionCoordinator() where animated {
      coordinator.animateAlongsideTransition(nil) { _ in
        completion()
      }
    } else {
      completion()
    }
  }
}
