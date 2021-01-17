//
//  DetailCell.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import UIKit
import Kingfisher

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.albumImageView.isUserInteractionEnabled = true
    }

    func configurate(model: [Album]?, with indexPath: IndexPath) {
        guard let model = model else {return}
        let stringUrl = model[indexPath.row].thumbnailUrl
        let albumTitle = model[indexPath.row].title
        let albumSubtitle = model[indexPath.row].id
        self.convertInToImage(stringUrl: stringUrl)
        self.titleLabel.text = "Фото \(albumSubtitle)"
        self.subtitleLabel.text = albumTitle
    }
    
    private func convertInToImage(stringUrl: String) {
        guard let url = URL(string: stringUrl) else {return}
        self.albumImageView.kf.setImage(with: url)
    }
}
