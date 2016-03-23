//
//  SWInitialViewController.swift
//  SampleWallet
//
//  Created by qbuser on 3/22/16.
//  Copyright © 2016 AnandMenon. All rights reserved.
//

import UIKit

class SWInitialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPageViewControllerDataSource {

    @IBOutlet weak var cardsContainerView: UIView!
    @IBOutlet weak var walletTableView: UITableView!
    
    var cardPageViews = UIPageViewController()
    let cardImageArray : NSMutableArray = ["image1.jpeg","image3.jpg"]
    var indexTracker   : Int? = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.addNavigationBar()
        self.cardPageViews = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.cardPageViews = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.cardPageViews.dataSource = self
        
        let startingCardView : SWCardsImageViewController = self.viewControllerAtIndex(0)!
        let cardsArray = [startingCardView]
        self.cardPageViews.setViewControllers(cardsArray, direction: .Forward , animated: true, completion: nil)
        self.cardPageViews.view.frame = CGRectMake(0, 0, self.cardsContainerView.frame.size.width, self.cardsContainerView.frame.size.height - 30);
        
        self.addChildViewController(self.cardPageViews)
        self.cardsContainerView.addSubview(self.cardPageViews.view)
        self.cardPageViews.didMoveToParentViewController(self)
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "This Week"
        case 1:
            return "last Week"
        default: return ""
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch (indexPath.section) {
            
        case 0 :
            let cell = self.addThisWeekCell(indexPath.row) as UITableViewCell
            return cell
            
        case 1:
            let cell = self.addLastWeekCell(indexPath.row) as UITableViewCell
            return cell
            
        default:
            let cell = self.addLastWeekCell(indexPath.row) as UITableViewCell
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        if section == 1 {
            return 1
        }
        return 0
    }
    
    //MARK: - UIPAGE VIEW DELEGATES
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.cardImageArray.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.cardImageArray.count
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index : Int = indexTracker!
        
        index++;
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index : Int = indexTracker!
        
        index--;
        return self.viewControllerAtIndex(index)
    }
    
    //MARK: - Private Methods
    
    func viewControllerAtIndex(index : Int) -> SWCardsImageViewController? {
        if ((index < 0) || (index >= self.cardImageArray.count)) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let cardImageVC = self.storyboard!.instantiateViewControllerWithIdentifier("cardsPageView") as! SWCardsImageViewController
        cardImageVC.cardImage = cardImageArray[index] as! String
        
        indexTracker = index;
        
        return cardImageVC;
    }
    
    func addThisWeekCell(indexPath : Int) -> SWThisWeekDueTableviewCell {
        
        let cellIdentifier : String = SWConstants.CellIdentifiers.ThisWeekCellId
        let dueDetail = SWDueDetails()
        let thisWeekCell : SWThisWeekDueTableviewCell = self.walletTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! SWThisWeekDueTableviewCell
        dueDetail.setDetailForDueNumber(indexPath)
        thisWeekCell.populateLabelsWithDetails(dueDetail)
        return thisWeekCell;
    }
    
    func addLastWeekCell(indexPath : Int) -> SWLastWeekDueTableViewCell {
        let cellIdentifier : String = SWConstants.CellIdentifiers.LastWeekCellId
        let dueDetail = SWDueDetails()
        let lastWeekCell : SWLastWeekDueTableViewCell = self.walletTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! SWLastWeekDueTableViewCell
        dueDetail.setDetailForDueNumber(indexPath)
        return lastWeekCell;
    }
    
    func addNavigationBar() {
        
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44))
        // Offset by 20 pixels vertically to take the status bar into account
        
        navigationBar.backgroundColor = UIColor.blackColor()
        navigationBar.barStyle = .BlackTranslucent;  // optional
        navigationBar.tintColor = UIColor.whiteColor()
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = "My Wallet"
        
        // Create left and right button for navigation item
        let leftButton =  UIBarButtonItem(title: "Back", style:   UIBarButtonItemStyle.Plain, target: self, action: nil)
        let rightButton = UIBarButtonItem(title: "Done", style:  UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        // Create two buttons for the navigation item
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
        
        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)
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
