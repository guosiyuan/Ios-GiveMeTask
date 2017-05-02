//
//  AllMessageTableViewCell.swift
//  GMT
//
//  Created by siyuan on 5/2/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import UIKit

class AllMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var MessagePoster: UILabel!
    
    @IBOutlet weak var Price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
