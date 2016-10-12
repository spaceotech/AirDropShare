//
//  DetailVC.swift
//  SOAirDropShare
//
//  Created by Hitesh on 10/12/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var fileName : String!
    var localFilePath : NSURL! = nil
    @IBOutlet weak var web: UIWebView!
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnShare: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnBack.layer.cornerRadius = 5.0
        btnBack.layer.masksToBounds = true
        
        btnShare.layer.cornerRadius = 5.0
        btnShare.layer.masksToBounds = true
        
        
        
        let arrComponent = fileName.componentsSeparatedByString(".")
        let filePath = NSBundle.mainBundle().pathForResource(arrComponent[0], ofType: arrComponent[1])
        
        localFilePath = NSURL(fileURLWithPath: filePath!)
        let request = NSURLRequest(URL: localFilePath)
        web.loadRequest(request)
        
    }

    
    @IBAction func actionShare(sender: AnyObject) {
        let objShare = [localFilePath]
        let objActivityController = UIActivityViewController(activityItems: objShare, applicationActivities: nil)
        // Exclude all activities except AirDrop.
        let excludedActivities = [UIActivityTypePostToTwitter, UIActivityTypePostToFacebook, UIActivityTypePostToWeibo, UIActivityTypeMessage, UIActivityTypeMail, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr, UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo]
        objActivityController.excludedActivityTypes = excludedActivities
        // Present the controller
        self.presentViewController(objActivityController, animated: true) {
            
        }
    }
    
    @IBAction func actionBack(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
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
