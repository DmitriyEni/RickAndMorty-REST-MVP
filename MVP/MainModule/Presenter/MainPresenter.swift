//
//  MainPresenter.swift
//  MVP
//
//  Created by Dmitriy Eni on 23.09.2022.
//

import Foundation
import Metal

protocol MainViewProtocol {
    func succes()
//    func failure(error: Error)
    func failure()

}

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getPerson()
    var persons: [Profile]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    private let view: MainViewProtocol
    private let networkService: NetworkServiceProtocol!
    internal var persons: [Profile]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getPerson()
    }
    
    func getPerson() {
        
        NetworkManager.getUserList { profiles in
//            guard let profiles = profiles else { return }
            self.persons = profiles
            print("getUserList")
            self.view.succes()
        } failureBlock: {
            print("failureBlock")
            self.view.failure()
        }
    }
}
