//
//  APIServicesBaseResponse.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 30/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation
import ObjectMapper

class APIServicesBaseResponse: Mappable {
  
  var code: Int?
  var status: String?
  
  // MARK: JSON
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    code <- map["code"]
    status <- map["status"]
  }
  
}
