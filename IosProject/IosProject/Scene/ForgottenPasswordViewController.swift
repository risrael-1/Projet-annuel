//
//  ForgottenPasswordViewController.swift
//  IosProject
//
//  Created by Eduard Serban on 27/07/2021.
//

import UIKit

class ForgottenPasswordViewController: UIViewController {

    @IBOutlet weak var emailLabel: UITextField!
    
    var userId: String = ""
    var apiService: ApiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendPressed(_ sender: UIButton) {
        self.apiService.forgottenPasswordEmailConfirmation(email: self.emailLabel.text) { (userId) in
            DispatchQueue.main.sync {
                self.userId = userId
                
                print(userId)
                
                if userId != "" {
                    let controller = ChangePasswordViewController.newInstance(userId: userId)
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }
            
            
        }
    }
    @IBAction func backPressed(_ sender: UIButton) {
        let controller = LoginViewController(nibName: "LoginViewController", bundle: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
