//
//  CalendarViewController.swift
//  ProjetAnnuelIos
//
//  Created by Raphael on 04/07/2021.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func HomeButton(_ sender: Any) {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func Profil(_ sender: Any) {
        let profilViewController = EditingProfilViewController(nibName: "EditingProfilViewController", bundle: nil)
        
        self.navigationController?.pushViewController(profilViewController, animated: true)
    }
    
    @IBAction func MessageButton(_ sender: Any) {
        let messageViewController = MessageViewController(nibName: "MessageViewController", bundle: nil)
        
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    @IBAction func HistoryButton(_ sender: Any) {
        let historyViewController = HistoryViewController(nibName: "HistoryViewController", bundle: nil)
        
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }
    


}
