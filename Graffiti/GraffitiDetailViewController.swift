//
//  GraffitiDetailViewController.swift
//  Graffiti
//
//  Created by Juan Manuel Jimenez Sanchez on 1/02/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

protocol GraffitiDetailViewControllerDelegate: class {
    /**
     Este protocolo permite que quien lo implemente pueda obtener el objeto graffiti
     
     - Autor:
     Juan Manuel
     
     - parameters:
        - sender: el origen de los datos
        - tagged: el objeto graffiti
     */
    func graffitiDidFinishGetTagged(sender: GraffitiDetailViewController, tagged: Graffiti)
}

class GraffitiDetailViewController: UIViewController {
    
    weak var delegate: GraffitiDetailViewControllerDelegate?

    @IBOutlet weak var imgGraffiti: UIImageView!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var taggedGraffiti: Graffiti?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "img_navbar_title")
        self.navigationItem.titleView = UIImageView(image: image)
        
        //Como la imagen no tiene acction... debemos crear un gesture recognizer
        let takePictureGesture = UITapGestureRecognizer(target: self, action: #selector(takePictureTapped))
        self.imgGraffiti.addGestureRecognizer(takePictureGesture)
        
        self.configureLabels()
    }

    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    ///Se encargará de mostrar correctamente los valores en las etiquetas
    func configureLabels() {
        self.latitudeLabel.text = String(format: "%.8f", (self.taggedGraffiti?.coordinate.latitude)!)
        self.longitudeLabel.text = String(format: "%.8f", (self.taggedGraffiti?.coordinate.longitude)!)
        self.addressLabel.text = self.taggedGraffiti?.address
    }
    
}

extension GraffitiDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    ///Se ejecuta cuando tocan la imagen
    func takePictureTapped() {
        //Si la camara está disponible entonces mostramos un actionSheet para elegir si quiere usar la camara o la librería
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.showPhotoMenu()
        } else {
            self.choosePhotoFromLibrary()
        }
    }
    
    ///Mostramos un alertSheet para decidir si quiero tomar la foto o usar una de la librería
    func showPhotoMenu() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let takePhotoAction = UIAlertAction(title: "SacarPhoto", style: .default) { (_) in
            self.takePhotoWithCamara()
        }
        alertController.addAction(takePhotoAction)
        
        let chooseFromLibraryAction = UIAlertAction(title: "Elegir de la librería", style: .default) { (_) in
            self.choosePhotoFromLibrary()
        }
        alertController.addAction(chooseFromLibraryAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    ///Muestra la librería
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    ///Muestra la cámara
    func takePhotoWithCamara() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imageTaken = info[UIImagePickerControllerEditedImage] as? UIImage
        self.imgGraffiti.image = imageTaken
        self.saveButton.isEnabled = true
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
