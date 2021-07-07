//
//  MessageViewController.swift
//  ProjetAnnuelIos
//
//  Created by Raphael on 06/07/2021.
//

import UIKit

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func HomeButton(_ sender: Any) {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func CalendarButton(_ sender: Any) {
        let calendarViewController = CalendarViewController(nibName: "CalendarViewController", bundle: nil)
        
        self.navigationController?.pushViewController(calendarViewController, animated: true)
    }
    
    @IBAction func ProfilButton(_ sender: Any) {
        let profilViewController = EditingProfilViewController(nibName: "EditingProfilViewController", bundle: nil)
        
        self.navigationController?.pushViewController(profilViewController, animated: true)
    }
    
    @IBAction func HistoryButton(_ sender: Any) {
        let historyViewController = HistoryViewController(nibName: "HistoryViewController", bundle: nil)
        
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }
    
}
