//
//  CRXAPIConfig.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 30/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation

class CRXAPIConfig {
  
  //BASE API CONFIG
  static let REQUEST_PARAM_OFFSET = "offset"
  static let API_PUBLIC_ENDPOINT = "v1/public/"
  static let defaultHeaders = ["Accept" : "application/json", "Content-Type" : "application/json"]
  
  //API PARAMS

  var apiUser: String!;
  var apiPass: String!;
  var apiClientId: String!;
  var apiSecret: String!;
  var service_base_url: String!
  
  var appdeveloper: String!;
  var redirect_uri: String!;
  
  
  static func loadAPIConfigFromBundle(_ fileName: String?) -> NSMutableDictionary {
    if(fileName != nil){
      let apiConfig = CRXPListUtils.getPListFileForBundleConfigKey(filenameKey: fileName!);
      let configDictionary = NSMutableDictionary(dictionary: apiConfig!);
      return configDictionary;
    }
    return NSMutableDictionary();
  }
  
  func setConfig(configDict: NSDictionary?){
    if let apiKEYS = configDict?["API"] as? Dictionary<String, AnyObject> {
      self.service_base_url = apiKEYS["API_URL"] as! String;
      self.apiUser = apiKEYS["API_USERNAME"] as! String;
      self.apiPass = apiKEYS["API_PASSWORD"] as! String;
      self.apiClientId = apiKEYS["API_CLIENTID"] as! String;
      self.apiSecret = apiKEYS["API_SECRET"] as! String;
      self.appdeveloper = apiKEYS["DEVELOPER_NAME"] as! String;
      self.redirect_uri = apiKEYS["REDIRECT_URI"] as! String;
    }
  }
}
