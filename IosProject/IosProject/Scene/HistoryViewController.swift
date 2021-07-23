//
//  HistoryViewController.swift
//  IosProject
//
//  Created by Raphael on 09/07/2021.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func homeButton(_ sender: Any) {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func calendarButton(_ sender: Any) {
        let calendarViewController = CalendarViewController(nibName: "CalendarViewController", bundle: nil)
        
        self.navigationController?.pushViewController(calendarViewController, animated: true)
    }
    
    @IBAction func profilButton(_ sender: Any) {
        let profilViewController = EditingProfilViewController(nibName: "EditingProfilViewController", bundle: nil)
        
        self.navigationController?.pushViewController(profilViewController, animated: true)
    }
    
    @IBAction func messageButton(_ sender: Any) {
        let messageViewController = MessageViewController(nibName: "MessageViewController", bundle: nil)
        
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    
}
