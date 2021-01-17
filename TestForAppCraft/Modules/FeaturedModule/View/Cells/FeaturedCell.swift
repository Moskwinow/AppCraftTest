//
//  FeaturedCell.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 17.01.2021.
//

import UIKit

class FeaturedCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configirate(with model: [CoreAlbums]?, with indexPath: IndexPath) {
        guard  let model = model else {
            return
        }
        self.titleLabel.text = "Альбом \(model[indexPath.row].id)"
        self.subtitleLabel.text = model[indexPath.row].title
    }

}
