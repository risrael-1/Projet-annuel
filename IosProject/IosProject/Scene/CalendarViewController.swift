//
//  CalendarViewController.swift
//  ProjetAnnuelIos
//
//  Created by Raphael on 04/07/2021.
//

import UIKit

class CalendarViewController: UIViewController {
    
    var APISigninResponse: APISigninResponse!
    
    
    static func newInstance(response: APISigninResponse) -> CalendarViewController {
        let controller = CalendarViewController()
        controller.APISigninResponse = response
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func HomeButton(_ sender: Any) {
        let homeViewController = HomeViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func Profil(_ sender: Any) {
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
    


}
