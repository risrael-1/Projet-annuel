//
//  HistoryViewController.swift
//  IosProject
//
//  Created by Raphael on 09/07/2021.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var APISigninResponse: APISigninResponse!
    var apiService: ApiService = ApiService()
    var annonces: [Annonce] = []
    @IBOutlet weak var annonceListTableView: UITableView!
    
    
    static func newInstance(response: APISigninResponse) -> HistoryViewController {
        let controller = HistoryViewController()
        controller.APISigninResponse = response
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.annonceListTableView.dataSource = self
//        self.annonceListTableView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        apiService.getAnnonces(token: APISigninResponse.token ?? "", completion: { (annonces) in
            self.annonces = annonces
            DispatchQueue.main.sync {
                self.annonceListTableView.reloadData()
            }
        })
    }
    
    
//Barre de nav
    @IBAction func homeButton(_ sender: Any) {
        let homeViewController = HomeViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    @IBAction func calendarButton(_ sender: Any) {
        let calendarViewController = CalendarViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(calendarViewController, animated: true)
    }
    
    @IBAction func profilButton(_ sender: Any) {
        let profilViewController = EditingProfilViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(profilViewController, animated: true)
    }
    
    @IBAction func messageButton(_ sender: Any) {
        let messageViewController = MessageViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    
}


extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.annonces.count
    }
    
    // indexPath.row -> n° de ligne
    // indexPath.section -> n° de la section (par def 1 section)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let annonce = self.annonces[indexPath.row] // recuperer le café à la bonne ligne
        let cell = self.getAnnonceCell(tableView: tableView)
        cell.textLabel?.text = "\(annonce.title) - \(annonce.category) le \(annonce.date) à \(annonce.time) "
        
        
        return cell
    }
    
    func getAnnonceCell(tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "annonce_identifier") else {
            return UITableViewCell(style: .default, reuseIdentifier: "annonce_identifier")
        }
        return cell
    }
}

//extension HistoryViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let annonce = self.annonces[indexPath.row] // recuperer le café à la bonne ligne
//        let controller = HistoryViewController.newInstance(match: match)
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
//}
