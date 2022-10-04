//
//  MainPresenter.swift
//  MVP
//
//  Created by Dmitriy Eni on 23.09.2022.
//

import Foundation

protocol MainViewProtocol {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getPerson()
    var persons: [Person]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    private let view: MainViewProtocol
    private let networkService: NetworkServiceProtocol!
    internal var persons: [Person]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getPerson()
    }
    
    func getPerson() {
        networkService.getPerson { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.sync {
                switch result {
                case .success(let persons):
                    self.persons = persons
                    self.view.succes()
                case .failure(let error):
                    self.view.failure(error: error)
                }
            }
        }
    }
}
