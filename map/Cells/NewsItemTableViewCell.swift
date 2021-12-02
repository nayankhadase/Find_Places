//
//  NewsItemTableViewCell.swift
//  map
//
//  Created by nayan.khadase on 01/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class NewsItemTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTime: UILabel!
    @IBOutlet weak var nesTitle: UILabel!
    @IBOutlet weak var newsDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
