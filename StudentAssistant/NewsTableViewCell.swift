//
//  NewsTableViewCell.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-12-08.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    //class variable
    var readMoreUrl = ""

    // outlets
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var articleTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
