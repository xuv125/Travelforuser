//
//  GoodsListMainViewController.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/09.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class GoodsListMainViewController: LxbaseViewController, UITableViewDelegate, UITableViewDataSource {
    var goodsScrollView:GoodsScrollView!
    var goodsListTableView:GoodsListTableView!
    
    var arrayList:NSMutableArray = NSMutableArray()
    var isRefreshTable:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var height_unit:CGFloat = (self.view.frame.height - NavigationBar_HEIGHT) / 10
        
        self.goodsListTableView = GoodsListTableView(frame: CGRectMake(0, height_unit * 4, SCREEN_WIDTH, height_unit * 6), style: UITableViewStyle.Plain)
        self.goodsListTableView.delegate = self
        self.goodsListTableView.dataSource = self
        
        self.view.addSubview(self.goodsListTableView)
        
        LxNetHelperSharedInstance.delegate = self
        LxNetHelperSharedInstance.lxViewController = self
        
        var strUrl = GetGoodsListAction + "?language_id=" + LanguageCode
        LxNetHelperSharedInstance.GET(strUrl, success: successGoodsList, failure: failureGoodsList)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reFlash() {
        
    }

    func tableView(tableView:UITableView!, numberOfRowsInSection section:Int) -> Int {
        return self.arrayList.count
    }
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        cell.text = "Row #\(indexPath.row)"
        cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        
        return cell
    }
    
    // #pragma mark - LxNetHelperDelegate
    func successGoodsList(responseObject:AnyObject!) {
        
        var json:NSArray = responseObject as NSArray
        
        for item:AnyObject in json {
            var nsdic:NSDictionary! = item as NSDictionary
            var lxGoodsInfoEntity:LxGoodsInfoEntity = LxGoodsInfoEntity()
            lxGoodsInfoEntity.initFormMap(nsdic)
            self.arrayList.addObject(lxGoodsInfoEntity)
        }

    }
    
    func failureGoodsList(error: NSError!) {
        println("GoodsListMainViewController failure: \(error)")
    }
}
