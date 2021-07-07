//
//  HomeViewController.swift
//  ProjetAnnuelIos
//
//  Created by Raphael on 26/06/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    @IBAction func CalendarButton(_ sender: Any) {
        let calendarViewController = CalendarViewController(nibName: "CalendarViewController", bundle: nil)
        
        self.navigationController?.pushViewController(calendarViewController, animated: true)
    }
    
    
    @IBAction func ProfilButton(_ sender: Any) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }

}
