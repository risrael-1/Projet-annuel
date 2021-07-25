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
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
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
        }
        
    }
    
    private func fetchAndReloadImageView(){
        print(self.user?.picLink)
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
    
    @IBAction func MessageButton(_ sender: Any) {
        let messageViewController = MessageViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    @IBAction func HistoryButton(_ sender: Any) {
        let historyViewController = HistoryViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }

}
