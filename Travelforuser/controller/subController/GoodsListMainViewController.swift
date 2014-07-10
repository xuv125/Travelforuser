//
//  GoodsListMainViewController.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/09.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class GoodsListMainViewController: LxbaseViewController, UITableViewDelegate, UITableViewDataSource {
//    var goodsScrollView:GoodsScrollView!
    var goodsListTableView:GoodsListTableView!
    var refreshControl:UIRefreshControl!
    
    var arrayList:NSMutableArray = NSMutableArray()
    var isRefreshTable:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var height_unit:CGFloat = (self.view.frame.height - NavigationBar_HEIGHT) / 10
        
        self.goodsListTableView = GoodsListTableView(frame: CGRectMake(0, height_unit * 4, SCREEN_WIDTH, height_unit * 6), style: UITableViewStyle.Plain)
        self.goodsListTableView.delegate = self
        self.goodsListTableView.dataSource = self
        
        self.goodsListTableView.registerClass(GoodsTableViewCell.self, forCellReuseIdentifier:"customCell")
        
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refersh")
        
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.goodsListTableView.addSubview(refreshControl)
        
        LxNetHelperSharedInstance.delegate = self
        LxNetHelperSharedInstance.lxViewController = self
        
        var strUrl = GetGoodsListAction + "?language=" + LanguageCode
        LxNetHelperSharedInstance.GET(strUrl, success: successGoodsList, failure: failureGoodsList, isCheckNet: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セクション数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    //セクションの行数
    func tableView(tableView:UITableView!, numberOfRowsInSection section:Int) -> Int {
        return self.arrayList.count
    }
    
    // セクション高さ
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return tableView.frame.height / 2
    }
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        var count:Int = self.arrayList.count
        println("GoodsListMainViewController:tableView self.arrayList.count:\(self.arrayList.count)")
        
        let cell: GoodsTableViewCell = self.goodsListTableView.dequeueReusableCellWithIdentifier("customCell") as GoodsTableViewCell
        
        if count < 1 {
            return cell
        }
        
        var ret:CGRect = CGRectMake(0, 0, SCREEN_WIDTH, tableView.frame.height / 2)

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
        
        self.view.addSubview(self.goodsListTableView)

    }
    
    func failureGoodsList(error: NSError!) {
        println("GoodsListMainViewController failure: \(error)")
    }
}
