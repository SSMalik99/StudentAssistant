//
//  TutorTableViewCell.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-12-07.
//

import UIKit

class TutorTableViewCell: UITableViewCell {

    @IBOutlet weak var teacherName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
