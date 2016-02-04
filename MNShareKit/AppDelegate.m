//
//  AppDelegate.m
//  MNShareKit
//
//  Created by luguangqing on 16/2/3.
//  Copyright © 2016年 luguangqing. All rights reserved.
//

#import "AppDelegate.h"
#import "MNShareKit.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MNShareKit weChatRegist];
    [MNShareKit sinaWeiboRegist];
    [MNShareKit qqRegist];
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

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [self handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [self handleOpenURL:url];
}

- (BOOL)handleOpenURL:(NSURL *)url {
    NSString *urlStr = url.absoluteString;
    if ([urlStr hasPrefix:@"wx"]) {
        return [WXApi handleOpenURL:url delegate:[MNPlatformCallback sharedInstance]];
    } else if ([urlStr hasPrefix:@"tencent"]) {
        return [TencentOAuth HandleOpenURL:url];
    } else if ([urlStr hasPrefix:@"wb"]) {
        return [WeiboSDK handleOpenURL:url delegate:[MNPlatformCallback sharedInstance]];
    }
    return true;
}

@end
