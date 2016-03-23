//
//  SWLastWeekDueTableViewCell.swift
//  SampleWallet
//
//  Created by qbuser on 3/22/16.
//  Copyright © 2016 AnandMenon. All rights reserved.
//

import UIKit

class SWLastWeekDueTableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
