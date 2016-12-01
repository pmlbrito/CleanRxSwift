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
  required init?(map: Map) {
    super.init(map: map)
  }
  
  override func mapping(map: Map) {
    super.mapping(map: map)
    items <- map["items"]
  }
  
}



class APIListItemObject: Mappable {
  var itemId: String?
  
  // MARK: JSON
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    itemId <- map["item_id"]
  }
  
}
