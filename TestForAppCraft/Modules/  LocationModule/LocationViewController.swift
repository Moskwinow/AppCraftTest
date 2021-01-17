//
//  LocationViewController.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 17.01.2021.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
    
    var presenter: LocationPresenter!
    var state: Bool = false
    
    @IBOutlet weak var locationTextView: UITextField!
    @IBOutlet weak var locationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.locationOutput = self
    }
    
    @IBAction func locationButtonAction(_ sender: UIButton!) {
        switch state {
        case false:
            presenter.startUpdate()
            locationButton.setTitle("Не отслеживать", for: .normal)
            state = true
        case true:
            locationButton.setTitle("Отслеживать", for: .normal)
            presenter.stopUpdate()
            state = false
       
        }
    }

}


extension LocationViewController: LocationManagerOutput {
    func newAddress(_ name: String) {
        DispatchQueue.main.async { [weak self] in
            self?.locationTextView.text = name
        }
    }
    
    
}
