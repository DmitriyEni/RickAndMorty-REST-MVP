//
//  ViewController.swift
//  MVP
//
//  Created by Dmitriy Eni on 23.09.2022.
//

import UIKit

class MainView: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func didTapButtonAction(sender: Any) {
        presenter.showGreeting()
    }
}

extension MainView: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
}
