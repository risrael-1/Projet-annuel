//
//  LoginViewController.swift
//  IosProject
//
//  Created by Raphael on 23/07/2021.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // TODO: appel api
    @IBAction func connexionButton(_ sender: Any) {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    

}
