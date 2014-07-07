//
//  AppDelegate.swift
//  travelforuser
//
//  Created by 倫星 on 2014/06/18.
//  Copyright (c) 2014年 倫星. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow!

    struct MainStoryboard {
        static let name = "Main"
        
        struct Identifiers {
            static let emptyViewController = "emptyViewController"
        }
    }
    
    // MARK: View Controller Accessor Convenience
    
    // The root view controller of the window will always be a UISplitViewController. This is setup in the main storyboard.
    var mainSplitViewController: MainSplitViewController {
        return self.window.rootViewController as MainSplitViewController
    }
    
    // The primary view controller of the split view controller defined in the main storyboard.
    var primaryViewController: MainNavigationController {
        var endIndex:Int = mainSplitViewController.viewControllers.endIndex
        var mainNavigationController: MainNavigationController = mainSplitViewController.viewControllers[endIndex] as MainNavigationController
        return mainNavigationController
//        return mainSplitViewController.viewControllers[0] as MainNavigationController
//
//            return nil
    }
    
//    // The view controller that displays the list of documents. If it's not visible, then this value is nil.
//    var listDocumentsViewController: ListDocumentsViewController? {
//        return primaryViewController.topViewController as? ListDocumentsViewController
//    }


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        // Override point for customization after application launch.
//        self.window!.backgroundColor = UIColor.whiteColor()
        
//        var mainTestViewController:MainTestViewController = MainTestViewController()
//        self.window!.addSubview(mainTestViewController.view)
//        self.window!.rootViewController = mainTestViewController
//        
//        self.window!.makeKeyAndVisible()
        
//        self.mainSplitViewController.preferredDisplayMode = .AllVisible
//        
//        self.mainSplitViewController.delegate = self
        LxAPPContainerSharedInstance.appInit()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.cdh.saveContext()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.cdh.saveContext()
    }

    var cdh: CoreDataHelper {
        if !_cdh {
            _cdh = CoreDataHelper()
        }
        return _cdh!
    }
    var _cdh: CoreDataHelper? = nil

    // MARK: UISplitViewControllerDelegate
    func targetDisplayModeForActionInSplitViewController(_: UISplitViewController) -> UISplitViewControllerDisplayMode {
        return .AllVisible
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController _: UIViewController) -> Bool {
        splitViewController.preferredDisplayMode = .Automatic
        
        // If there's a list that's currently selected in separated mode and we want to show it in collapsed mode, we'll transfer over the view controller's settings.
        if let secondaryViewController = secondaryViewController as? MainNavigationController {
            primaryViewController.navigationBar.titleTextAttributes = secondaryViewController.navigationBar.titleTextAttributes
            primaryViewController.navigationBar.tintColor = secondaryViewController.navigationBar.tintColor
            primaryViewController.toolbar.tintColor = secondaryViewController.toolbar.tintColor
            
            primaryViewController.showDetailViewController(secondaryViewController.topViewController, sender: nil)
        }
        
        return true
    }
    
    func splitViewController(splitViewController: UISplitViewController, separateSecondaryViewControllerFromPrimaryViewController _: UIViewController) -> UIViewController? {
        // If no list is on the stack, fill the detail area with an empty controller.
        if primaryViewController.topViewController === primaryViewController.viewControllers[0] {
            let storyboard = UIStoryboard(name: MainStoryboard.name, bundle: nil)
            
            return storyboard.instantiateViewControllerWithIdentifier(MainStoryboard.Identifiers.emptyViewController) as? MainViewController
        }
        
        let textAttributes = primaryViewController.navigationBar.titleTextAttributes
        let tintColor = primaryViewController.navigationBar.tintColor
        let poppedViewController = primaryViewController.popViewControllerAnimated(false)
        
        let navigationViewController = MainNavigationController(rootViewController: poppedViewController)
        navigationViewController.navigationBar.titleTextAttributes = textAttributes
        navigationViewController.navigationBar.tintColor = tintColor
        navigationViewController.toolbar.tintColor = tintColor
        
        return navigationViewController
    }
}

