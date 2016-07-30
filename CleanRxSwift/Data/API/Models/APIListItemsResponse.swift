//
//  APIListItemsResponse.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 30/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation
import ObjectMapper

class APIListItemsResponse: APIServicesBaseResponse {
  var items: [APIListItemObject]?
  
  // MARK: JSON
  required init?(_ map: Map) {
    super.init(map)
  }
  
  override func mapping(map: Map) {
    super.mapping(map)
    items <- map["items"]
  }
  
}



class APIListItemObject: Mappable {
  var item_id: String?
  
  // MARK: JSON
  required init?(_ map: Map) { }
  
  func mapping(map: Map) {
    item_id <- map["item_id"]
  }
  
}
