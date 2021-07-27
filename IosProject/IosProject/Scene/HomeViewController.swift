//
//  HomeViewController.swift
//  ProjetAnnuelIos
//
//  Created by Raphael on 26/06/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    var APISigninResponse: APISigninResponse!
    var user: User!
    var annonce: Annonce!
    var message: String = ""
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var annonceTitleLabel: UILabel!
    @IBOutlet weak var annonceDescriptionLabel: UILabel!
    @IBOutlet weak var annonceDate: UILabel!
    @IBOutlet weak var annonceHeureLabel: UILabel!
    @IBOutlet weak var annonceAddressLabel: UILabel!
    @IBOutlet weak var annonceClientEmail: UILabel!
    @IBOutlet weak var annoncePhoneNumber: UILabel!
    
    var apiService: ApiService = ApiService()
    var imageService: ImageService = ImageService()
    
    
    
    
    static func newInstance(response: APISigninResponse) -> HomeViewController {
        let controller = HomeViewController()
        controller.APISigninResponse = response
        return controller
    }
    
    private func reloadUI(){
        if let id = self.APISigninResponse?.userId {
            self.apiService.getUserInfos(userId: id, token: self.APISigninResponse.token ?? "", completion: { (user) in
                DispatchQueue.main.sync {
                    print("reussit")
                    self.user = user
                    self.fetchAndReloadImageView()
                    
                    
                    self.nameLabel.text = user?.fullName
                    self.addressLabel.text = user?.address
                    self.emailLabel.text = user?.email
                }
            })
            self.apiService.getMessage(token: self.APISigninResponse?.token ?? "") { (message) in
                DispatchQueue.main.sync {
                    self.message = message
                    
                    self.messageLabel.text = message
                }
            }
            
            self.apiService.getAnnonceTakenByUserId(token: self.APISigninResponse.token ?? "", userId: APISigninResponse.userId ?? "") { (annonce) in
                DispatchQueue.main.sync {
                    self.annonce = annonce
                    
                    self.annonceTitleLabel.text = (self.annonceTitleLabel.text ?? "") + (annonce?.title ?? "")
                    self.annonceDescriptionLabel.text = (self.annonceDescriptionLabel.text ?? "") + (annonce?.desc ?? "")
                    self.annonceDate.text = (self.annonceDate.text ?? "") + (annonce?.date ?? "")
                    self.annonceHeureLabel.text = (self.annonceHeureLabel.text ?? "") + (annonce?.time ?? "")
                    self.annonceAddressLabel.text = (self.annonceAddressLabel.text ?? "") + (annonce?.address ?? "")
                    self.annonceClientEmail.text = (self.annonceClientEmail.text ?? "") + (annonce?.email ?? "")
                    self.annoncePhoneNumber.text = (self.annoncePhoneNumber.text ?? "") + (annonce?.phone ?? "")
                }
            }
            
        }
        
    }
    
    private func fetchAndReloadImageView(){
        if let profilePic = URL(string: self.user?.picLink ?? "https://miro.medium.com/max/978/1*pUEZd8z__1p-7ICIO1NZFA.png") {
            self.imageService.getImage(from: profilePic) { (img) in
                DispatchQueue.main.sync {
                    self.profileImageView.image = img
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 10
        
        reloadUI()
        
//        print(self.APISigninResponse?.description)
        // Do any additional setup after loading the view.
    }
    @IBAction func CalendarButton(_ sender: Any) {
        let calendarViewController = CalendarViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(calendarViewController, animated: true)
    }
    
    
    @IBAction func ProfilButton(_ sender: Any) {
        let profilViewController = EditingProfilViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(profilViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }

    @IBAction func contactButton(_ sender: UIButton) {
        
    }
    
    @IBAction func AnnonceButton(_ sender: UIButton) {
        let historyViewController = HistoryViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }
}
