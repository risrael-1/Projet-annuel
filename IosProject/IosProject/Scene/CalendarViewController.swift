//
//  CalendarViewController.swift
//  ProjetAnnuelIos
//
//  Created by Raphael on 04/07/2021.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {
    
    var dateFormat: String = "dd/MM/YYYY"
    
    var apiService: ApiService = ApiService()
    var APISigninResponse: APISigninResponse!
    var annoncesNumber: Int!
    var today: String = ""
    var annonces: [Annonce] = []
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var annoncesTableView: UITableView!
    
    static func newInstance(response: APISigninResponse?) -> CalendarViewController {
        let controller = CalendarViewController()
        controller.APISigninResponse = response
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.APISigninResponse == nil) {
            let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            
            self.navigationController?.pushViewController(loginViewController, animated: true)
        }
        
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = self.dateFormat
        
        self.today = formatter.string(from: today)
        self.dateLabel.text = self.today
        
        reloadUI()
        
        calendar.delegate = self
        self.annoncesTableView.delegate = self
        self.annoncesTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.dateFormat
        self.dateLabel.text = dateFormatter.string(from: date)
        self.today = dateFormatter.string(from: date)
        
        reloadUI()
        
        
    }
    
    func reloadUI() {
        self.apiService.countAnnoncesByDateAndTakenBy(token: self.APISigninResponse?.token ?? "", date: self.today) { (count) in
            DispatchQueue.main.sync {
                self.annoncesNumber = count
                
                self.countLabel.text = "\(count)"
            }
        }
        self.apiService.getAnnoncesByTakenAndDate(token: APISigninResponse.token ?? "", date: self.today,  completion: { (annonces) in
            self.annonces = annonces
            DispatchQueue.main.sync {
                self.annoncesTableView.reloadData()
            }
        })
    }

    @IBAction func HomeButton(_ sender: Any) {
        let homeViewController = HomeViewController.newInstance(response: APISigninResponse, from: nil)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func Profil(_ sender: Any) {
        let profilViewController = EditingProfilViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(profilViewController, animated: true)
    }
    
    @IBAction func annonceButton(_ sender: UIButton) {
        let historyViewController = HistoryViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }
    @IBAction func contactButton(_ sender: UIButton) {
        
        let contactViewController = ContactUsViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(contactViewController, animated: true)
    }
}

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.annonces.count
    }
    
    // indexPath.row -> n° de ligne
    // indexPath.section -> n° de la section (par def 1 section)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let annonce = self.annonces[indexPath.row] // recuperer le café à la bonne ligne
        let cell = self.getAnnonceCell(tableView: tableView)
        cell.textLabel?.text = "\(annonce.category) le \(annonce.date)"
        
        
        return cell
    }
    
    func getAnnonceCell(tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "annonce_identifier") else {
            return UITableViewCell(style: .default, reuseIdentifier: "annonce_identifier")
        }
        return cell
    }
}

extension CalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let annonce = self.annonces[indexPath.row] // recuperer le café à la bonne ligne
        let controller = AnnonceDetailViewController.newInstance(response: APISigninResponse, annonceId: annonce.id ?? "", from: "calendarController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
