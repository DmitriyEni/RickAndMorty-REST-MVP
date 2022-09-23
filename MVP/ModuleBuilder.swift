//
//  ModuleBuilder.swift
//  MVP
//
//  Created by Dmitriy Eni on 23.09.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "David", lasName: "Blain")
        let view = MainView()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
