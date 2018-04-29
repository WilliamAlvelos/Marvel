//
//  Characters.swift
//  Animations
//
//  Created by William Alvelos on 2/8/18.
//  Copyright © 2018 William Alvelos. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire

protocol CharactersServiceProtocol {
    func get(completion: @escaping([Results])-> Void, error: @escaping(NSError) -> Void)
}


enum MethodType {
    case characters
    case Genre
    case Credits
    case Video
}

final class CharactersService: CharactersServiceProtocol {
    
    
    func get(completion: @escaping ([Results]) -> Void, error: @escaping (NSError) -> Void) {
        APIManager().getFrom("characters") { (response) in
            if let json = response as? [String : Any] {
                let characters = MARVEL(JSON: json)

                completion(characters?.data?.results ?? [])
            } else {
                error(NSError(domain: "", code: -1, userInfo: nil))
            }
        }
    }
    
    //TODO :- Change this fucking shit to another place, here it`s looks good but not enough
//    private func getUrlWith(methodType: MethodType, id: Int? = nil) -> String{
//        switch methodType {
//        case .characters:
//            return
//        case .Genre:
//            return APIManager.marvel + "genre/movie/list"
//        case .Credits:
//            return APIManager.marvel + "movie/\(id ?? 0)/credits"
//        case .Video:
//            return APIManager.marvel + "movie/\(id ?? 0)/videos"
//
//        }
//    }
//
//    func get(error: @escaping (NSError) -> Void) -> Observable<[Characters]> {
//        APIManager().getFrom(getUrlWith(methodType: .characters)) { (result) in
//            if let data = result as? Data {
//                do {
//                    let characters = try JSONDecoder().decode(Json4Swift_Base.self, from: data)
//
//                    completion(characters.data?.results)
//                } catch let jsonError {
//                    error(NSError(domain: jsonError.localizedDescription, code: 2, userInfo: nil))
//                }
//            }else{
//                error(NSError(domain: "", code: 1, userInfo: nil))
//            }
//        }
//    }
    
//    func get(completion: @escaping([Characters]?) -> Void, error:@escaping(NSError) -> Void) {
//
//        APIManager().getFrom(getUrlWith(methodType: .characters)) { (result) in
//            if let data = result as? Data {
//                do {
//                    let characters = try JSONDecoder().decode(Json4Swift_Base.self, from: data)
//
//                    completion(characters.data?.results)
//                } catch let jsonError {
//                    error(NSError(domain: jsonError.localizedDescription, code: 2, userInfo: nil))
//                }
//            }else{
//                error(NSError(domain: "", code: 1, userInfo: nil))
//            }
//        }
//    }
}

//final class CharactersMock: CharactersServiceProtocol {
//    func get() -> Observable<[Results]> {
//        return APIManager().getFrom("characters")
//    }
//}

