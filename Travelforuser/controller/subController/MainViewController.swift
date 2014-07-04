//
//  InfoListViewController.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/03.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class MainViewController: LxbaseViewController, UISplitViewControllerDelegate {
    
    var mainPopoverController:UIPopoverController?
    
    @IBOutlet var toolBar:UIToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    // #pragma mark: UISplitViewControllerDelegate
    func splitViewController(svc: UISplitViewController!, willHideViewController aViewController: UIViewController!, withBarButtonItem barButtonItem: UIBarButtonItem!, forPopoverController pc: UIPopoverController!) {
        barButtonItem.title = "Customers"
        var items:NSMutableArray = NSMutableArray(array: self.toolBar.items, copyItems:true)
        items.insertObject(barButtonItem, atIndex: 0)
        self.toolBar.setItems(items, animated: true)
        
        mainPopoverController = pc
    }

    func splitViewController(svc: UISplitViewController!, willShowViewController aViewController: UIViewController!, invalidatingBarButtonItem barButtonItem: UIBarButtonItem!) {
        var items:NSMutableArray = NSMutableArray(array: self.toolBar.items, copyItems:true)
        items.removeObject(barButtonItem)
        self.toolBar.setItems(items, animated: true)
        mainPopoverController = nil
    }

}
