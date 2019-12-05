//
//  AppDelegate.m
//  TestScrollView
//
//  Created by 超 on 2019/12/4.
//  Copyright © 2019 chao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.window=[[UIWindow alloc]initWithFrame: [UIScreen mainScreen].bounds];
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController=[[ViewController alloc]init];
    
    
    
    return YES;
}






@end
