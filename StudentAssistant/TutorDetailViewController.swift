//
//  TutorDetailViewController.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-12-07.
//

import UIKit

class TutorDetailViewController: UIViewController {

   // class variables
    var selectedTeacherTag = ""
    var teacherModel = TutorModel()
    
    //Outlets
    @IBOutlet weak var teacherNameLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var emailLable: UILabel!
    
    
    @IBOutlet weak var phoneLable: UILabel!
    
    @IBOutlet weak var availabilityLabel: UILabel!
    
    
    @IBOutlet weak var timeLable: UILabel!
    
    
    func retrieveTeacherDetails()-> [String:String]{
        return teacherModel.teacherDetails[selectedTeacherTag]! as! [String : String]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let teacherDetail = retrieveTeacherDetails()
        
        // Do any additional setup after loading the view.
        
        teacherNameLabel.text = teacherDetail["name"]
        countryLabel.text = "Country : " + teacherDetail["country"]!
        languageLabel.text = "Language: " + teacherDetail["language"]!
        timeLable.text = "Time: " + teacherDetail["time"]!
        emailLable.text = "Email: " + teacherDetail["email"]!
        phoneLable.text = "Phone: "+teacherDetail["contact"]!
        availabilityLabel.text = "Availability: " + teacherDetail["availability"]!
        
        
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
