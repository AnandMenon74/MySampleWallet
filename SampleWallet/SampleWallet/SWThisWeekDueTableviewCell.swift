//
//  ThisWeekDueTableviewCell.swift
//  SampleWallet
//
//  Created by qbuser on 3/22/16.
//  Copyright © 2016 AnandMenon. All rights reserved.
//

import UIKit

class SWThisWeekDueTableviewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func populateLabelsWithDetails(dueDetails : SWDueDetails){
        
        dateLabel.text = dueDetails.date
        amountLabel.text = dueDetails.amountDetail
        locationLabel.text = dueDetails.locationDetail
    }
}
