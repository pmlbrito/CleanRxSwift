# QuickShotUtils

<!--[![CI Status](http://img.shields.io/travis/Pedro Brito/QuickShotUtils.svg?style=flat)](https://travis-ci.org/Pedro Brito/QuickShotUtils)-->
<!--[![Version](https://img.shields.io/cocoapods/v/QuickShotUtils.svg?style=flat)](http://cocoapods.org/pods/QuickShotUtils)-->
<!--[![License](https://img.shields.io/cocoapods/l/QuickShotUtils.svg?style=flat)](http://cocoapods.org/pods/QuickShotUtils)-->
<!--[![Platform](https://img.shields.io/cocoapods/p/QuickShotUtils.svg?style=flat)](http://cocoapods.org/pods/QuickShotUtils)-->
 
 QuickShotUtils are a couple of Classes and extensions that add some specific quick custom behaviour to already existing code base.
 
 
## Utility extensions to:
 * Math
 * String
 * UIColor
 * UIImage
 * UIView
 * UIViewController
 * UINavigationController
 
## UI View Subclasses:
 * QSUFloatingLabelTextField
 
## Utility classes and methods:
 * isNilOrEmpty
 * QSUDeviceExtension
 * QSUTimeUtils
 * QSUPlistUtils
 
## Requirements
 * ARC
 * iOS8
 
## Installation
 
 QuickShotUtils is available through [CocoaPods](http://cocoapods.org). To install
 it, simply add the following line to your Podfile:
 
 ```ruby
 pod 'QuickShotUtils', :git => 'https://github.com/pmlbrito/QuickShotUtils.git'
 ```
 
## Usage
 
 ```Swift
 import QuickShotUtils
 
 CGFloat.random().roundToDecimals(2)
 ```
 
## Example Project
 
 An example project is included with this repo.  To run the example project, clone the repo, and run `pod install` from the Example directory first.
 
## Author
 
 Pedro Brito, pedroml.brito@gmail.com
 
## License
 
 QuickShotUtils is available under the MIT license. See the LICENSE file for more info.
