//
//  GraffitiDetailViewController.swift
//  Graffiti
//
//  Created by Juan Manuel Jimenez Sanchez on 1/02/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

class GraffitiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "img_navbar_title")
        self.navigationItem.titleView = UIImageView(image: image)
    }

    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
