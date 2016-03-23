//
//  SWDueDetails.swift
//  SampleWallet
//
//  Created by qbuser on 3/22/16.
//  Copyright © 2016 AnandMenon. All rights reserved.
//

import UIKit

enum DueLocation : Int {
    case Ballantyne=0,TargetCom
}
class SWDueDetails: NSObject {

    var locationDetail  : String? = ""
    var amountDetail    : String? = ""
    var date       : String? = ""
    
    func setDetailForDueNumber(number : Int) {
        switch number {
        case DueLocation.Ballantyne.rawValue:
            locationDetail  = "Target (Ballantyne Location)"
            amountDetail    = "-$549.31"
            date            = "FEBRUARY 6TH, 2016"
            
        case DueLocation.TargetCom.rawValue:
            locationDetail  = "Target.com"
            amountDetail    = "-$215.3"
            date            = "FEBRUARY 3rd, 2016"
            
        default:
            locationDetail  = ""
            amountDetail    = ""
            date            = ""
        }
    }
}
