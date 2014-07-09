//
//  GoodsListCollectionViewController.swift
//  Travelforuser
//
//  Created by 倫星 on 2014/07/08.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

class GoodsListCollectionViewController: LxbaseCollectionViewController {

    
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        getFlickrPhotos()
//    }
//    
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//    }
//    
//    func getFlickrPhotos()
//    {
//        let manager :AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
//        let url :String = "https://api.flickr.com/services/rest/"
//        let parameters :Dictionary = [
//            "method"         : "flickr.interestingness.getList",
//            "api_key"        : "86997f23273f5a518b027e2c8c019b0f",
//            "per_page"       : "99",
//            "format"         : "json",
//            "nojsoncallback" : "1",
//            "extras"         : "url_q,url_z",
//        ]
//        let requestSuccess = {
//            (operation :AFHTTPRequestOperation!, responseObject :AnyObject!) -> Void in
//            SVProgressHUD.dismiss()
//            self.photos = responseObject.objectForKey("photos").objectForKey("photo") as Array
//            self.collectionView.reloadData()
//            NSLog("requestSuccess \(responseObject)")
//        }
//        let requestFailure = {
//            (operation :AFHTTPRequestOperation!, error :NSError!) -> Void in
//            SVProgressHUD.dismiss()
//            NSLog("requestFailure: \(error)")
//        }
//        SVProgressHUD.show()
//        manager.GET(url, parameters: parameters, success: requestSuccess, failure: requestFailure)
//    }
//    
//    // MARK: - UICollectionView
//    
//    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
//    {
//        return self.photos.count;
//    }
//    
//    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!
//    {
//        let photoCell: PhotoCell = self.collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as PhotoCell
//        let photoInfo = photos[indexPath.item] as Dictionary
//        let photoUrlString = (self.layoutType == LayoutType.Grid) ? photoInfo["url_q"] : photoInfo["url_z"]
//        let photoUrlRequest : NSURLRequest = NSURLRequest(URL: NSURL.URLWithString(photoUrlString))
//        
//        let imageRequestSuccess = {
//            (request : NSURLRequest!, response : NSHTTPURLResponse!, image : UIImage!) -> Void in
//            photoCell.photoImageView.image = image;
//            photoCell.photoImageView.alpha = 0
//            UIView.animateWithDuration(0.2, animations: {
//                photoCell.photoImageView.alpha = 1.0
//                })
//        }
//        let imageRequestFailure = {
//            (request : NSURLRequest!, response : NSHTTPURLResponse!, error : NSError!) -> Void in
//            NSLog("imageRequrestFailure")
//        }
//        photoCell.photoImageView.setImageWithURLRequest(photoUrlRequest, placeholderImage: nil, success: imageRequestSuccess, failure: imageRequestFailure)
//        
//        photoCell.photoInfo = photoInfo
//        return photoCell;
//    }
//    
//    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize
//    {
//        var itemSize : CGSize = CGSizeMake(320, 150)
//        return itemSize
//    }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
//    {
////        if segue.identifier == "ShowPhoto"
////        {
////            let photoCell : PhotoCell = sender as PhotoCell
////            var photoViewController = segue.destinationViewController as PhotoViewController
////            photoViewController.photoInfo = photoCell.photoInfo
////        }
//    }
}
