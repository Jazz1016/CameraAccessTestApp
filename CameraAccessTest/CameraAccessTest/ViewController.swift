//
//  ViewController.swift
//  CameraAccessTest
//
//  Created by James Lea on 7/23/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.backgroundColor = .secondarySystemBackground
        
        button.backgroundColor = .systemBlue
        button.setTitle("Take Picture", for: .normal)
        button.setTitleColor(.white, for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func didTapButton(){
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        imageView.image = image
    }
    
    
}
