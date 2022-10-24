//
//  NatworkManager.swift
//  MVP
//
//  Created by Dmitriy Eni on 24.10.2022.
//

import Foundation
import Moya
import Moya_ObjectMapper

class NetworkManager {
    static let provider = MoyaProvider<BackendAPI>(plugins: [NetworkLoggerPlugin()])
    
    class func getUserList(successBlock: (([Profile]) -> ())?, failureBlock: (() -> ())?) {
        provider.request(.findAllUsers) { result in
            switch result {
                
            case .success(let response):
                guard let profiles = try? response.mapObject(Content.self) else {
                    failureBlock?()
                    return
                }
                print(profiles)

                successBlock?(profiles.results)
            case .failure(_):
                failureBlock?()
            }
        }
    }
}
