//
//  GraffitiImageViewController.swift
//  Graffiti
//
//  Created by Juan Manuel Jimenez Sanchez on 4/02/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

class GraffitiImageViewController: UIViewController {

    @IBOutlet weak var graffitiImage: UIImageView!
    var selectedCallout: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedCallout = self.selectedCallout {
            self.graffitiImage.image = selectedCallout
        }
    }

    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
