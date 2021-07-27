//
//  AnnonceDetailViewController.swift
//  IosProject
//
//  Created by Eduard Serban on 26/07/2021.
//

import UIKit

class AnnonceDetailViewController: UIViewController {
    
    var APISigninResponse: APISigninResponse!
    var apiService: ApiService = ApiService()
    var imageService: ImageService = ImageService()
    var user: User!
    var annonce: Annonce!
    var annonceId: String!
    var from: String = ""

    @IBOutlet weak var annonceTitleLabel: UILabel!
    @IBOutlet weak var annonceDescriptionLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userAddressLabel: UILabel!
    @IBOutlet weak var userCityLabel: UILabel!
    @IBOutlet weak var userPhoneNumberLabel: UILabel!
    @IBOutlet weak var userCreatedAtLabel: UILabel!
    @IBOutlet weak var annonceCategoryLabel: UILabel!
    @IBOutlet weak var annonceDateLabel: UILabel!
    @IBOutlet weak var annonceTimeLabel: UILabel!
    @IBOutlet weak var annonceStatusLabel: UILabel!
    @IBOutlet weak var leftActionButton: UIButton!
    
    static func newInstance(response: APISigninResponse?, annonceId: String, from: String) -> AnnonceDetailViewController {
        let controller = AnnonceDetailViewController()
        controller.APISigninResponse = response
        controller.annonceId = annonceId
        controller.from = from
        return controller
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if (self.APISigninResponse == nil) {
            let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            
            self.navigationController?.pushViewController(loginViewController, animated: true)
        }
        
        if from != "annonceList" {
            self.leftActionButton.setTitle("", for: .normal)
        }
        self.reloadUI()
    }
    
    
    private func reloadUI(){
        if let id = self.annonceId {
            self.apiService.getAnnonceInfos(token: self.APISigninResponse?.token ?? "", annonceId: id, completion: { (annonce) in
                DispatchQueue.main.sync {
                    print("reussit")
                    self.annonce = annonce
                    
                    self.annonceTitleLabel.text = annonce?.title
                    self.annonceDescriptionLabel.text = annonce?.desc
                    self.annonceDateLabel.text = (self.annonceDateLabel.text ?? "") + (annonce?.date ?? "")
                    self.annonceTimeLabel.text = (self.annonceTimeLabel.text ?? "") + (annonce?.time ?? "")
                    self.annonceStatusLabel.text = (self.annonceStatusLabel.text ?? "") + (annonce?.status ?? "")
                    self.annonceCategoryLabel.text = (self.annonceCategoryLabel.text ?? "") + (annonce?.category ?? "")
                    
                }
                
                print(annonce?.user_id ?? "")
                
                self.apiService.getUserById(token: self.APISigninResponse?.token ?? "", userId: annonce?.user_id ?? "", completion: { (user) in
                    DispatchQueue.main.sync {
                        print("reussit")
                        self.user = user
                        
                        self.userNameLabel.text = (self.userNameLabel.text ?? "") + (user?.fullName ?? "")
                        self.userAddressLabel.text = (self.userAddressLabel.text ?? "") + (user?.address ?? "")
                        self.userCityLabel.text = (self.userCityLabel.text ?? "") + (user?.city ?? "")
                        self.userPhoneNumberLabel.text = (self.userPhoneNumberLabel.text ?? "") + (user?.phoneNumber ?? "")
                        self.userEmailLabel.text = (self.userEmailLabel.text ?? "") + (user?.email ?? "")
                        self.userCreatedAtLabel.text = (self.userCreatedAtLabel.text ?? "") + (user?.createdAt ?? "")
                    }
                })
            })
        }
        
        
        
        
        
    }

    @IBAction func returnHandler(_ sender: UIButton) {
        let controller: UIViewController
        if self.from == "annonceList" {
            controller = HistoryViewController.newInstance(response: self.APISigninResponse)
        }else {
            controller = CalendarViewController.newInstance(response: self.APISigninResponse)
        }
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
    @IBAction func takenHandler(_ sender: UIButton) {
        
        if self.from != "annonceList" {
            return
        }
        
        self.apiService.setTakenBy(token: self.APISigninResponse.token ?? "", annonce_id: self.annonceId, user_id: self.APISigninResponse.userId ?? "") { (success) in
            if (success) {
                DispatchQueue.main.sync {
                    
                    let historyViewController = HistoryViewController.newInstance(response: self.APISigninResponse)
                    
                    self.navigationController?.pushViewController(historyViewController, animated: true)
                }
                
            }
        }
    }
}
