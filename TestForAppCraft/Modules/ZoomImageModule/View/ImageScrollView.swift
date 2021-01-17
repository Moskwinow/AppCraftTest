//
//  ImageScrollView.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import UIKit

class ImageScrollView: UIScrollView {
    var imageZoomView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func set(image: UIImage) {
        imageZoomView = UIImageView(image: image)
        imageZoomView.removeFromSuperview()
        self.addSubview(imageZoomView)
        configurateImage(imageSize: image.size)
    }

    
    func configurateImage(imageSize: CGSize) {
        let boundsSize = self.bounds.size
        let imageSize = imageSize
        let xScale = boundsSize.width / imageSize.width
        let yScale = boundsSize.height / imageSize.height
        let minScale = min(xScale, yScale)
        var maxScale: CGFloat = 1.0
        
        if minScale < 0.1 {
            maxScale = 0.3
        }
        if minScale >= 0.1 && minScale < 0.5 {
            maxScale = 0.7
        }
        if minScale >= 0.5 {
            maxScale = max(1.0, minScale)
        }
        self.minimumZoomScale = minScale
        self.maximumZoomScale = maxScale
        self.zoomScale = minimumZoomScale

    }
    
}

extension ImageScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
       return imageZoomView
    }
}
