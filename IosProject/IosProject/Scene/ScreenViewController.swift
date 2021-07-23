//
//  ScreenViewController.swift
//  IosProject
//
//  Created by Raphael on 23/07/2021.
//

import UIKit

class ScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            
            self.navigationController?.pushViewController(loginViewController, animated: true)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
