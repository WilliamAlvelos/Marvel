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

enum ResponseValue {
    case onSuccess([String: Any]?)
    case onError(Error)
}

class APIManager: NSObject {

    // MARK: - Vars and Lets
    private let marvel = "http://gateway.marvel.com/v1/public/"

    private var defaultParams: [String: Any] = Marvel.defaultParams

    // MARK: - Methods
    func getFrom(_ method: String, params: [String: Any]? = nil, completion: @escaping(ResponseValue) -> Void) {

        Alamofire.request(marvel + method, method: .get, parameters: defaultParams)
            .validate()
            .responseJSON { (response) in
                print("GET: \(response.request?.url?.absoluteString ?? "")")

                switch response.result {
                case .success:
                    do {
                        completion(.onSuccess(try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any]))
                    } catch {
                        completion(.onError(NSError(domain: "", code: -1, userInfo: nil)))
                    }
                case let .failure(error):
                    completion(.onError(error))
                }
        }
    }
}
