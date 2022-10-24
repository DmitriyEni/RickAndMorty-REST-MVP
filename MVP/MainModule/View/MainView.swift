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
        tableView.dataSource = self
//        tableView.delegate = self
        let nib = UINib(nibName: String(describing: PersonCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: PersonCell.self))
        spiner.startAnimating()
    }
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let persons = presenter.persons else { return 2}
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonCell.self), for: indexPath) as! PersonCell
        guard let persone = presenter.persons?[indexPath.row] else { return cell }
            cell.setupCell(person: persone)
        return cell
    }
}

extension MainView: MainViewProtocol {
    func succes() {
        tableView.reloadData()
        spiner.stopAnimating()

    }
    
    func failure() {
//        func failure(error: Error) {

//        print(error.localizedDescription)
        spiner.stopAnimating()
//        statusLabel.text = error.localizedDescription
    }
}
