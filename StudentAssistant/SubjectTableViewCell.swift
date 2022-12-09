//
//  SubjectTableViewCell.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-12-07.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var subjectName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    
}
