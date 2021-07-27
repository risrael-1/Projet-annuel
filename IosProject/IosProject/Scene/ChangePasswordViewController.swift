//
//  ChangePasswordViewController.swift
//  IosProject
//
//  Created by Eduard Serban on 27/07/2021.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    var userId: String = ""
    
    @IBOutlet weak var newPasswordLabel: UITextField!
    
    var apiService: ApiService = ApiService()
    
    
    static func newInstance(userId: String) -> ChangePasswordViewController {
        let controller = ChangePasswordViewController()
        controller.userId = userId
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSendPressed(_ sender: UIButton) {
        
        self.apiService.resetPassword(userId: self.userId, newPassword: self.newPasswordLabel.text) { (success) in
            if success {
                DispatchQueue.main.sync {
                    let controller = LoginViewController(nibName: "LoginViewController", bundle: nil)
                    
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }
        }
        
        
    }
    @IBAction func onCancelPressed(_ sender: UIButton) {
        
        let controller = LoginViewController(nibName: "LoginViewController", bundle: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
