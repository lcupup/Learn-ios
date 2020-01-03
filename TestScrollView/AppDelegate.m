//
//  AppDelegate.m
//  TestScrollView
//
//  Created by 超 on 2019/12/4.
//  Copyright © 2019 chao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NetViewController.h"
#import "TabviewViewController.h"
#import "TryFDViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.window=[[UIWindow alloc]initWithFrame: [UIScreen mainScreen].bounds];
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    UINavigationController * nav=[[UINavigationController alloc] initWithRootViewController:[[TryFDViewController alloc]init]];
    self.window.rootViewController=nav;
    
    
    
    return YES;
}






@end
