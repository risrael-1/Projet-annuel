//
//  MessageViewController.swift
//  ProjetAnnuelIos
//
//  Created by Raphael on 06/07/2021.
//

import UIKit

class MessageViewController: UIViewController {
    
    var APISigninResponse: APISigninResponse!
    
    
    static func newInstance(response: APISigninResponse) -> MessageViewController {
        let controller = MessageViewController()
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
    
    @IBAction func CalendarButton(_ sender: Any) {
        let calendarViewController = CalendarViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(calendarViewController, animated: true)
    }
    
    @IBAction func ProfilButton(_ sender: Any) {
        let profilViewController = EditingProfilViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(profilViewController, animated: true)
    }
    
    @IBAction func HistoryButton(_ sender: Any) {
        let historyViewController = HistoryViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }
    
}
