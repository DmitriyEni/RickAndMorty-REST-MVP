//
//  BackandAPI.swift
//  MVP
//
//  Created by Dmitriy Eni on 24.10.2022.
//

import Foundation
import Moya

enum BackendAPI {
    case findAllUsers
}

extension BackendAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://rickandmortyapi.com/api")!
    }
    
    var path: String {
        switch self {
        case .findAllUsers:
            return "/character"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .findAllUsers:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
