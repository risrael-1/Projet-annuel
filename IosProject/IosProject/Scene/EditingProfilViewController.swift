//
//  EditingProfilViewController.swift
//  ProjetAnnuelIos
//
//  Created by Raphael on 06/07/2021.
//

import UIKit

class EditingProfilViewController: UIViewController {
    var user: User!
    var APISigninResponse: APISigninResponse!
    var apiService: ApiService = ApiService()
    var imageService: ImageService = ImageService()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var cityInput: UITextField!
    @IBOutlet weak var phoneNumberInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reloadUI()
        
        
        // Do any additional setup after loading the view.
    }
    static func newInstance(response: APISigninResponse) -> EditingProfilViewController {
        let controller = EditingProfilViewController()
        controller.APISigninResponse = response
        return controller
    }

    @IBAction func homeButton(_ sender: Any) {
        let homeViewController = HomeViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func calendarButton(_ sender: Any) {
        let calendarViewController = CalendarViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(calendarViewController, animated: true)
    }
    
    @IBAction func messageButton(_ sender: Any) {
        let messageViewController = MessageViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    @IBAction func historyButton(_ sender: Any) {
        let historyViewController = HistoryViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }
    private func fetchAndReloadImageView(){
        
        if let profilePic = URL(string: self.user?.picLink ?? "https://miro.medium.com/max/978/1*pUEZd8z__1p-7ICIO1NZFA.png") {
            self.imageService.getImage(from: profilePic) { (img) in
                DispatchQueue.main.sync {
                    self.imageView.image = img
                }
            }
        }
    }
    
    private func reloadUI(){
        if let id = self.APISigninResponse?.userId {
            self.apiService.getUserInfos(userId: id, token: self.APISigninResponse.token ?? "", completion: { (user) in
                DispatchQueue.main.sync {
                    print("reussit")
                    self.user = user
                    self.fetchAndReloadImageView()
                    
                    self.lastNameInput.text = user?.fullName
                    self.addressInput.text = user?.address
                    self.cityInput.text = user?.city
                    self.phoneNumberInput.text = user?.phoneNumber
                    self.emailInput.text = user?.email
                }
            })
        }
        
    }
    
    
    
    @IBAction func tapButtonProfil(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    

    @IBAction func modifyInfosHandler(_ sender: UIButton) {
        guard let fullName = self.lastNameInput.text,
              let phoneNumber = self.phoneNumberInput.text,
              let email = self.emailInput.text,
              let address = self.addressInput.text,
              let city = self.cityInput.text else {
            return
        }
        let updatedUser = User(id: self.user.id, fullName: fullName, phoneNumber: phoneNumber, email: email, createdAt: self.user.createdAt, type: self.user.type, address: address, city: city, picLink: self.user.picLink)
        
        self.apiService.updateUser(user: updatedUser, token: self.APISigninResponse.token ?? "") { (success) in
                if(success) {
                    self.reloadUI()
                    self.fetchAndReloadImageView()
                }else{
                    print("pas ok")
                }
        }    }
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
