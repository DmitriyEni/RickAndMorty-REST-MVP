//
//  ViewController.swift
//  MVP
//
//  Created by Dmitriy Eni on 23.09.2022.
//

import UIKit

class MainView: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: String(describing: PersonCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: PersonCell.self))
        spiner.startAnimating()
    }
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.persons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonCell.self), for: indexPath) as! PersonCell
        let persone = presenter.persons?[indexPath.row]
        if let person = persone {
            cell.setupCell(person: person)
            return cell
        }
        return cell
    }}

extension MainView: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
        spiner.stopAnimating()
        statusLabel.text = error.localizedDescription
    }
}
