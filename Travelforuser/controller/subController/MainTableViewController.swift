//
//  MainTableViewController.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/03.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class MainTableViewController: LxbaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var height_unit:CGFloat = (self.view.frame.height - NavigationBar_HEIGHT) / 10
        
        self.tableView.registerClass(GoodsAreaTableViewCell.self, forCellReuseIdentifier:"scrollCell")
        self.tableView.registerClass(GoodsTableViewCell.self, forCellReuseIdentifier:"customCell")
        
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refersh")
        
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
//        self.tableView.addSubview(refreshControl)
        
        LxNetHelperSharedInstance.delegate = self
        LxNetHelperSharedInstance.lxViewController = self
        
        var strUrl = GetGoodsListAction + "?language_id=" + LanguageCode
        LxNetHelperSharedInstance.GET(strUrl, success: successGoodsList, failure: failureGoodsList, isCheckNet: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セクション高さ
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return tableView.frame.height / 3
    }
    
    override func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        var count:Int = self.arrayList.count
        println("MainTableViewController:tableView self.arrayList.count:\(self.arrayList.count)")
        
        var ret:CGRect = CGRectMake(0, 0, SCREEN_WIDTH, tableView.frame.height / 3)
        
        if 0 == indexPath.row {
            let cell:GoodsAreaTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("scrollCell") as GoodsAreaTableViewCell
            
            var entity:LxbaseEntity = LxbaseEntity()
            entity.isEmpty = false
            
            cell.configure(ret, entity: entity, atIndexPath : indexPath)
            
            return cell
        } else {
        
            let cell:GoodsTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("customCell") as GoodsTableViewCell
        
            if indexPath.row < count {
                println(indexPath.row)
                var entity:LxGoodsInfoEntity = self.arrayList[indexPath.row] as LxGoodsInfoEntity
            
                if false == entity.isEmpty {
                    //cell中身セット（引数　セル、indexPath）
                    cell.configure(ret, entity: entity, atIndexPath : indexPath)
                }
            }
            return cell
        }
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    func refresh(refresh:UIRefreshControl) {
        refresh.beginRefreshing()
        refresh.attributedTitle = NSAttributedString(string: "Loading...")
        var formatter:NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        var lastUpdated:String = formatter.stringFromDate(NSDate.date())
        refresh.attributedTitle = NSAttributedString(string: lastUpdated)
        refresh.endRefreshing()
    }
    
    // #pragma mark - LxNetHelperDelegate
    func successGoodsList(responseObject:AnyObject!) {
        
        var json:NSArray = responseObject as NSArray
        
        for item:AnyObject in json {
            var nsdic:NSDictionary! = item as NSDictionary
            var entity:LxGoodsInfoEntity = LxGoodsInfoEntity()
            entity.initFormMap(nsdic)
            
            println(entity.toString())
            
            self.arrayList.addObject(entity)
        }
        self.tableView.reloadData()
        
    }
    
    func failureGoodsList(error: NSError!) {
        println("MainTableViewController failure: \(error)")
    }
}
