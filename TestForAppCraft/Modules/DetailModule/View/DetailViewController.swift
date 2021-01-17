//
//  DetailViewController.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import UIKit

class DetailViewController: UITableViewController {
    
    @IBOutlet weak var startButtonItem: UIBarButtonItem!
    
    var presenter: DetailPresenter?
    var router: DetailRouter?
    var coreDM: CoreDataManager!
    
    var state: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreDM = CoreDataManager.shared
    }

    
    @IBAction func startButtonAction(_ sender: UIBarButtonItem) {
        switch state {
        case false:
            let coreAlbum = CoreAlbums(context: coreDM.context)
            guard let album = presenter?.albumsModel else {return}
            coreAlbum.id = Int16(album.id)
            coreAlbum.userId = Int16(album.userId)
            coreAlbum.title = album.title
            coreDM.save()
            state = true
        case true :
            let alert = UIAlertController(title: "Ошибка", message: "Альбом уже сохранен", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.DetailCell, for: indexPath) as! DetailCell
        cell.configurate(model: presenter?.model, with: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router = DetailRouter(passingData: presenter?.model?[indexPath.row].url ?? "", controller: self.navigationController!)
        router?.route()
    }

}

extension DetailViewController: DetailPresenterOutput {
    func success() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func error() {
        
    }
    
}
