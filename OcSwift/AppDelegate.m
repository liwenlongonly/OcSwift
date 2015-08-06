//
//  AppDelegate.m
//  OcSwift
//
//  Created by 李文龙 on 15/7/29.
//  Copyright (c) 2015年 李文龙. All rights reserved.
//

#import "AppDelegate.h"
#import "OcSwift-Swift.h"
#import "CommonUtils.h"

@interface AppDelegate ()
{
    
}
@end

@implementation AppDelegate

#pragma mark - Private Method

- (UIViewController*)createTabBarController
{
    MainViewController * mainVC = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
    mainVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:ImageNamed(@"tabBar_home_img") tag:0];
    mainVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    UINavigationController * mainNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    
    TwoViewController * twoVC = [[TwoViewController alloc]initWithNibName:@"TwoViewController" bundle:nil];
    twoVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:ImageNamed(@"tabBar_coupon_img") tag:0];
    twoVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    UINavigationController * twoNav = [[UINavigationController alloc]initWithRootViewController:twoVC];
    
    ThreeViewController * threeVC = [[ThreeViewController alloc]initWithNibName:@"ThreeViewController" bundle:nil];
    threeVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:ImageNamed(@"tabBar_my_img") tag:0];
    threeVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    UINavigationController * threeNav = [[UINavigationController alloc]initWithRootViewController:threeVC];
    
    _tabBarController = [[UITabBarController alloc]init];
    _tabBarController.viewControllers = @[mainNav,twoNav,threeNav];
    _tabBarController.selectedIndex = 0;
    _tabBarController.tabBar.tintColor = [UIColor redColor];
    _tabBarController.hidesBottomBarWhenPushed = YES;
    return _tabBarController;
}

#pragma mark - Lifecycle Method
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.rootViewController = [self createTabBarController];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [CommonUtils copyBundleFile:@"www" toDocumentFile:@"www"];
    });
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
