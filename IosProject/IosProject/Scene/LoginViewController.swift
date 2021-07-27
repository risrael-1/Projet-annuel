//
//  LoginViewController.swift
//  IosProject
//
//  Created by Raphael on 23/07/2021.
//

import UIKit

class LoginViewController: UIViewController {
    var APISigninResponse: APISigninResponse? = nil
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    var apiService: ApiService = ApiService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordInput.isSecureTextEntry = true

        // Do any additional setup after loading the view.
    }

    @IBAction func connectionPressed(_ sender: UIButton) {
        self.apiService.signin(login: self.loginInput.text, password: self.passwordInput.text, completion: { (response) in
            if (response!.success) {
                DispatchQueue.main.sync {
                    self.APISigninResponse = response
                    let homeViewController = HomeViewController.newInstance(response: response!, from: "login")
                    
                    self.navigationController?.pushViewController(homeViewController, animated: true)
                }
                
            }else{
                DispatchQueue.main.sync {
                    Toast.makeErrorToast(text: "Veuillez vérifier vos identifiants de connexion", view: self.view)
                }
                
            }
        })
    }
    
    @IBAction func onSignupPressed(_ sender: UIButton) {
        
        let controller = SignupViewController(nibName: "SignupViewController", bundle: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func onForgottenPasswordPressed(_ sender: UIButton) {
        let controller = ForgottenPasswordViewController(nibName: "ForgottenPasswordViewController", bundle: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
