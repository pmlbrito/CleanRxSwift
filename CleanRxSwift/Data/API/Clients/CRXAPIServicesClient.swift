//
//  CRXAPIServicesClient.swift
//  CleanRxSwift
//
//  Created by Pedro Brito on 30/07/16.
//  Copyright © 2016 pedroml.brito. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire
import ObjectMapper
import AlamofireObjectMapper

protocol CRXAPIServicesClientProtocol {
  //unfortunatelly object mapper does not handle generic inner types well... no cigar for you there we have to use specific response types
    func getListItems(offset: Int) -> Observable<APIListItemsResponse?>?
}

class CRXAPIServicesClient: CRXAPIServicesClientProtocol {
  
  var manager: Alamofire.Manager
  let apiconfigLoaded: NSDictionary?
  
  var apiConfig: CRXAPIConfig?;
  
  required init() {
    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    manager = Alamofire.Manager(configuration: configuration)
    apiconfigLoaded = CRXAPIConfig.loadAPIConfigFromBundle("APIConfig");
    
    //parse API CONFIG
    self.apiConfig = CRXAPIConfig();
    self.apiConfig!.setConfig(apiconfigLoaded);
  }
  
  func getURLRequest(apiURL: String) -> NSMutableURLRequest {
    let URL = NSURL(string: apiURL)!
    let mutableURLRequest = NSMutableURLRequest(URL: URL)
    mutableURLRequest.HTTPMethod = Method.GET.rawValue
    
    
    return mutableURLRequest;
  }
  
  func getListItems(offset: Int) -> Observable<APIListItemsResponse?>? {
    
    return Observable.create { observer in
      
      let apiPath = "\((self.apiConfig!.service_base_url!))/path_to_somewhere"
      let requestParams = [CRXAPIConfig.REQUEST_PARAM_OFFSET : "\(offset)"]

      
      let request = self.manager.request(.GET, apiPath, parameters: requestParams, encoding: .URL, headers: nil).responseObject(keyPath: "") { (response: Response<APIListItemsResponse, NSError>) in
        //TODO:
        print("\(response.result)");
        
        if ((response.result.error) != nil) {
          observer.on(.Error(response.result.error!))
        } else {
          observer.on(.Next(response.result.value))
          observer.on(.Completed)
        }
      }
      
      return AnonymousDisposable {
        request.cancel()
      }
    }
  }
}
