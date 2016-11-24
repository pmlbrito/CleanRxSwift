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
    func getListItems(_ offset: Int) -> Observable<APIListItemsResponse?>?
}


enum Router: URLRequestConvertible {
    case getListItems(baseAPIPath: String, parameters: Parameters)
    
//    static let baseURLString = "https://example.com"
    
    var method: HTTPMethod {
        switch self {
        case .getListItems(_,_):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getListItems(let baseAPIPath, _):
            return "\(baseAPIPath)/path_to_somewhere"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
//        let url = try Router.baseURLString.asURL()
        
        var urlRequest = try URLRequest(url: path.asURL())
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getListItems(_, let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        return urlRequest
    }
}



class CRXAPIServicesClient: CRXAPIServicesClientProtocol {
  
    var manager: Alamofire.SessionManager
  let apiconfigLoaded: NSDictionary?
  
  var apiConfig: CRXAPIConfig?;
  
  required init() {
    let configuration = URLSessionConfiguration.default
    manager = Alamofire.SessionManager(configuration: configuration)
    apiconfigLoaded = CRXAPIConfig.loadAPIConfigFromBundle("APIConfig");
    
    //parse API CONFIG
    self.apiConfig = CRXAPIConfig();
    self.apiConfig!.setConfig(configDict: apiconfigLoaded);
  }
  
  func getURLRequest(_ apiURL: String) -> NSMutableURLRequest {
    let URL = Foundation.URL(string: apiURL)!
    let mutableURLRequest = NSMutableURLRequest(url: URL)
    mutableURLRequest.httpMethod = HTTPMethod.get.rawValue
    
    
    return mutableURLRequest;
  }
  
  func getListItems(_ offset: Int) -> Observable<APIListItemsResponse?>? {
    
    return Observable.create { observer in
      
      let apiPath = "\((self.apiConfig!.service_base_url!))/path_to_somewhere"
      let requestParams = [CRXAPIConfig.REQUEST_PARAM_OFFSET : "\(offset)"]

      
//      let request = self.manager.request(.GET, apiPath, parameters: requestParams, encoding: .url, headers: nil).responseObject(keyPath: "") { (response: Response<APIListItemsResponse, NSError>) in
//        //TODO:
//        print("\(response.result)");
//        
//        if ((response.result.error) != nil) {
//          observer.on(.Error(response.result.error!))
//        } else {
//          observer.on(.Next(response.result.value))
//          observer.on(.Completed)
//        }
//      }
//      
//      return AnonymousDisposable {
//        request.cancel()
//      }
        
        
        
        let getListOfItemsRequest = Router.getListItems(baseAPIPath: apiPath, parameters: requestParams);
        
        let request = self.manager.request(getListOfItemsRequest).responseObject(keyPath: ""){ (response: DataResponse<APIListItemsResponse>) in
            //TODO:
            print("\(response.result)");
            
            if ((response.result.error) != nil) {
                observer.on(.error(response.result.error!))
            } else {
                observer.on(.next(response.result.value))
                observer.on(.completed)
            }
        }

        return request as! Disposable;
    }
  }
}
