//
//  MainPresenter.swift
//  MVP
//
//  Created by Dmitriy Eni on 23.09.2022.
//

import Foundation

protocol MainViewProtocol {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person

    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "\(self.person.firstName) \(self.person.lasName)"
        self.view.setGreeting(greeting: greeting)
    }
}
