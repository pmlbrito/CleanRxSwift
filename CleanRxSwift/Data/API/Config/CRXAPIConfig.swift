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

  var apiKey: String!;
  var apiSecret: String!;
  var service_base_url: String!
  
  static func loadAPIConfigFromBundle(fileName: String?) -> NSMutableDictionary {
    if(fileName != nil){
      let apiConfig = CRXPListUtils.getPListFileForBundleConfigKey(fileName!);
      let configDictionary = NSMutableDictionary(dictionary: apiConfig!);
      return configDictionary;
    }
    return NSMutableDictionary();
  }
  
  func setConfig(configDict: NSDictionary?){
    let apiKEYS = configDict?["API"];
    if(apiKEYS != nil){
      self.service_base_url = apiKEYS!["API_URL"] as! String;
      self.apiKey = apiKEYS!["API_PUBLIC_KEY"] as! String;
      self.apiSecret = apiKEYS!["API_PRIVATE_KEY"] as! String;
    }
  }
}
