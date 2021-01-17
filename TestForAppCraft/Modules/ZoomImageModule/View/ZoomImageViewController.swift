//
//  ZoomImageViewController.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import UIKit

class ZoomImageViewController: UIViewController {
    
    var imageScrollView: ImageScrollView!
    var presenter: ZoomImagePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        self.configureImageScrollView()
        self.getImage()
    }
    
    private func getImage() {
        let url = URL(string: presenter.imageUrl)
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url!) else {return}
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else {return}
                self.imageScrollView.set(image: image)
            }
        }
    }
    
  private func configureImageScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            imageScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}
