//
//  ProfileViewController.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-12-07.
//

import UIKit


class ProfileViewController: UIViewController {

    //outlets
    @IBOutlet weak var studentName: UILabel!
    
    @IBOutlet weak var studentEmail: UILabel!
    
    @IBOutlet weak var studentMobile: UIView!
    
    @IBOutlet weak var studentMobileLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        studentName.text = UserDefaults.standard.string(forKey: Constants().FULL_NAME)
        
        studentEmail.text = UserDefaults.standard.string(forKey: Constants().EMAIL)
        
        studentMobileLabel.text = UserDefaults.standard.string(forKey: Constants().PHONE)
        
        
       
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
