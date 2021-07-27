//
//  SignupViewController.swift
//  IosProject
//
//  Created by Eduard Serban on 27/07/2021.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    var APISigninResponse: APISigninResponse? = nil
    var apiService: ApiService = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onSignupPressed(_ sender: UIButton) {
        
        self.apiService.signup(fullName: self.fullNameLabel.text, email: self.emailLabel.text, password: self.passwordLabel.text) { (response) in
            if(response!.success) {
                DispatchQueue.main.sync {
                    self.APISigninResponse = response
                    let controller = HomeViewController.newInstance(response: response!, from: "login")
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }else {
                print("pas ok")
            }
        }
    }
    @IBAction func onBackPressed(_ sender: UIButton) {
        let controller = LoginViewController(nibName: "LoginViewController", bundle: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}
