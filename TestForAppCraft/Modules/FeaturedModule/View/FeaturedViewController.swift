//
//  FeaturedViewController.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 17.01.2021.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var presenter: FeaturedPresenter!
    var coreDM: CoreDataManager?
   
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurateUI()
    }
    
    func configurateUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.coreAlbums?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.FeaturedCell, for: indexPath) as! FeaturedCell
        cell.configirate(with: presenter.coreAlbums, with: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            coreDM?.context.delete((presenter.coreAlbums?[indexPath.row])!)
            presenter.coreAlbums?.remove(at: indexPath.row)
           try? coreDM?.context.save()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

