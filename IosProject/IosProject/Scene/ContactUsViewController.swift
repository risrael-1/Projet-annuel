//
//  ContactUsViewController.swift
//  IosProject
//
//  Created by Eduard Serban on 27/07/2021.
//

import UIKit
import MessageUI
import Toast_Swift

class ContactUsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var APISigninResponse: APISigninResponse!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static func newInstance(response: APISigninResponse?) -> ContactUsViewController {
        let controller = ContactUsViewController()
        controller.APISigninResponse = response
        return controller
    }

    @IBAction func onSendMailPressed(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {

             let mailComposeViewController = MFMailComposeViewController()
             mailComposeViewController.mailComposeDelegate = self
             mailComposeViewController.setToRecipients(["team.support@benevold.com"])
             mailComposeViewController.setSubject("Contact Supprt")

             present(mailComposeViewController, animated: true, completion: nil)

        }else {
            Toast.makeSuccessToast(text: "Le systeme email est pas viable", view: self.view)
        }
        
    }
    @IBAction func homeButton(_ sender: UIButton) {
        
        let homeViewController = HomeViewController.newInstance(response: APISigninResponse, from: nil)
        
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    @IBAction func calendarButton(_ sender: UIButton) {
        let calendarViewController = CalendarViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(calendarViewController, animated: true)
        
    }
    @IBAction func infosButton(_ sender: UIButton) {
        let infosViewController = EditingProfilViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(infosViewController, animated: true)
        
    }
    @IBAction func annoncesButton(_ sender: UIButton) {
        let annonceViewController = HistoryViewController.newInstance(response: APISigninResponse)
        
        self.navigationController?.pushViewController(annonceViewController, animated: true)
        
    }
}
