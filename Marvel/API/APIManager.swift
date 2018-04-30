//
//  APIManager.swift
//  Animations
//
//  Created by William Alvelos on 2/8/18.
//  Copyright © 2018 William Alvelos. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa
import RxAlamofire


////
////  APIManager.swift
////  Animations
////
////  Created by William Alvelos on 2/8/18.
////  Copyright © 2018 William Alvelos. All rights reserved.
////
//
//import Foundation
//import RxSwift
//import RxAlamofire
//import ObjectMapper
//
//
//extension ObservableType {
//    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
//        return flatMap { JSON -> Observable<T> in
//            guard let object = Mapper<T>().map(JSONObject: JSON) else {
//                throw NSError(
//                    domain: "",
//                    code: -1,
//                    userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
//                )
//            }
//
//            return Observable.just(object)
//        }
//    }
//
//    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
//        return flatMap { JSON -> Observable<[T]> in
//            guard let objects = Mapper<T>().mapArray(JSONObject: JSON) else {
//                throw NSError(
//                    domain: "",
//                    code: -1,
//                    userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"]
//                )
//            }
//
//            return Observable.just(objects)
//        }
//    }
//}
//
//class APIManager: NSObject {
//
//    //MARK:- Vars and Lets
//    private let marvel = "http://gateway.marvel.com/v1/public/"
//
//    private var parameters : [String: Any] = Marvel.defaultParams
//
//    //MARK:- Methods
//    func getFrom(_ method: String, params: [String: Any]? = nil) -> Observable {
//        return RxAlamofire
//            .request(.get, marvel + method, parameters: params, headers: nil)
//            .validate()
//            .responseJSON()
//    }
//
//}


class APIManager: NSObject {
    
    //MARK:- Vars and Lets
    private let marvel = "http://gateway.marvel.com/v1/public/"
    
    private var defaultParams : [String: Any] = Marvel.defaultParams
    
    //MARK:- Methods
    func getFrom(_ method: String, params: [String: Any]? = nil, completion: @escaping(Any?) -> Void) {
        
        Alamofire.request(marvel + method, method: .get, parameters: defaultParams)
            .validate()
            .responseJSON { (response) in
                print("GET: \(response.request?.url?.absoluteString ?? "")")

                switch response.result
                {
                case .success:
                    do {
                        completion(try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String : Any])
                    } catch {
                        completion(NSError(domain: "", code: -1, userInfo: nil))
                    }
                    break
                case .failure(let error):
                    completion(error)
                    break
                }
        }
    }
}
