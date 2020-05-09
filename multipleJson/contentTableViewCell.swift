//
//  contentTableViewCell.swift
//  multipleJson
//
//  Created by harishreddy kora on 12/03/20.
//  Copyright © 2020 harishreddy kora. All rights reserved.
//

import UIKit

class contentTableViewCell: UITableViewCell {
    
    
    

    @IBOutlet weak var imageDisplay: UIImageView!
    
    
    @IBOutlet weak var idLable: UILabel!
    
    
    @IBOutlet weak var nameLable: UILabel!
    
    
    @IBOutlet weak var linkLable: UILabel!
    
    @IBOutlet weak var sessionsLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
