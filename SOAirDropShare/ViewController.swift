//
//  ViewController.swift
//  SOAirDropShare
//
//  Created by Hitesh on 10/12/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        tblList.reloadData()
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = "IMAGE"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "PDF"
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "TEXT"
        }
        
        return cell
    }

    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let objDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVCID") as! DetailVC
        if indexPath.row == 0 {
            objDetailVC.fileName = "Airdrop.png"
        } else if indexPath.row == 1 {
            objDetailVC.fileName = "Airdrop.pdf"
        } else if indexPath.row == 2 {
            objDetailVC.fileName = "Airdrop.txt"
        }
        
        self.navigationController?.pushViewController(objDetailVC, animated: true)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

