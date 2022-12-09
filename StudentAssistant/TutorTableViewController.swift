//
//  TutorTableViewController.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-12-07.
//

import UIKit

class TutorTableViewController: UITableViewController {
    
    var tutorModel = TutorModel()
    
    var selectedSubject = ""
    
    func getTeacherList () -> Array<String>{
        
        return tutorModel.teachersForSubject[selectedSubject] as! Array<String>
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
//        we need to change accoding to the subject teachers
        
        let tutorList = getTeacherList()
        
        return tutorList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherList", for: indexPath) as! TutorTableViewCell

        // Configure the cell...
        cell.teacherName.text = getTeacherList()[indexPath.row]
        
//        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
//        cell.tag = cell.teacherName.text?.split(separator: " ").joined(separator: "_")
        
        
        


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // get the view cell
        let whichCell = sender as! TutorTableViewCell
        
//        get new view controller
        let destinationView = segue.destination as! TutorDetailViewController
        
        // set value of the new view properties
//        destinationView.selectedSubject = whichCell.subjectName.text!
        destinationView.selectedTeacherTag = (whichCell.teacherName.text?.split(separator: " ").joined(separator: "_"))! 
        
    }
    

}
