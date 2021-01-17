//
//  MainCell.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    func configurate(model: [Albums]?, with indexPath: IndexPath) {
        guard let model = model else {return}
        let albumNumber = model[indexPath.row].id
        let albumTitle = model[indexPath.row].title
        self.titleLabel.text = "Альбом \(albumNumber)"
        self.subtitleLabel.text = albumTitle
    }

}
