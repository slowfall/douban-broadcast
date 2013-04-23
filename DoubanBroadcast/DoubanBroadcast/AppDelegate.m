//
//  AppDelegate.m
//  DoubanBroadcast
//
//  Created by Zack on 20/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import "AppDelegate.h"
#import <libDoubanApiEngine/DOUAPIEngine.h>

@implementation AppDelegate
static NSString * const kAPIKey = @"01078b207383c5510316a1615a8b4ff3";
static NSString * const kPrivateKey = @"fade1696d036c642";
static NSString * const kRedirectUrl = @"http://www.douban.com/location/mobile";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DOUService *service = [DOUService sharedInstance];
    service.clientId = kAPIKey;
    service.clientSecret = kPrivateKey;
    if ([service isValid]) {
        service.apiBaseUrlString = kHttpsApiBaseUrl;
    }
    else {
        service.apiBaseUrlString = kHttpApiBaseUrl;
    }
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
