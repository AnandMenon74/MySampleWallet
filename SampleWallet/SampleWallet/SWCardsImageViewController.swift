//
//  SWCardsImageViewController.swift
//  SampleWallet
//
//  Created by qbuser on 3/22/16.
//  Copyright © 2016 AnandMenon. All rights reserved.
//

import UIKit

class SWCardsImageViewController: UIViewController {

    @IBOutlet weak var cardsImage: UIImageView!
    var pageIndex : Int?
    var cardImage : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.cardsImage.image = UIImage(named: self.cardImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
