//
//  EditingProfilViewController.swift
//  ProjetAnnuelIos
//
//  Created by Raphael on 06/07/2021.
//

import UIKit

class EditingProfilViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func homeButton(_ sender: Any) {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func calendarButton(_ sender: Any) {
        let calendarViewController = CalendarViewController(nibName: "CalendarViewController", bundle: nil)
        
        self.navigationController?.pushViewController(calendarViewController, animated: true)
    }
    
    @IBAction func messageButton(_ sender: Any) {
        let messageViewController = MessageViewController(nibName: "MessageViewController", bundle: nil)
        
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    @IBAction func historyButton(_ sender: Any) {
        let historyViewController = HistoryViewController(nibName: "HistoryViewController", bundle: nil)
        
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }
    
    
    
    @IBAction func tapButtonProfil(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    

}

extension EditingProfilViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
