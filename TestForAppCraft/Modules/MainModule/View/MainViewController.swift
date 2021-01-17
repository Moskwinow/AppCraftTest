//
//  MainViewController.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 15.01.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenter?
    var router: Router?
    
    override func loadView() {
        super.loadView()
        self.presenter = MainPresenter(requestFactory: RequestFactory(), delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurateUI()
    }
    
    @IBAction func starBarItemAction(_ sender: UIBarButtonItem!) {
        router = MainRouter(controller: self.navigationController!)
        router?.routeToFeatured()
    }
    
    @IBAction func locationBarItemAction(_ sender: UIBarButtonItem!) {
        router = MainRouter(controller: self.navigationController!)
        router?.routeToLocation()
    }
    
    private func configurateUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainCell, for: indexPath) as! MainCell
        cell.configurate(model: presenter?.model, with: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router = MainRouter(passingData: presenter?.model?[indexPath.row], controller: self.navigationController!)
        router?.route()
    }
    
}

extension MainViewController: MainPresenterOutput {
    func success() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    func error() {
        
    }
    
    
}
