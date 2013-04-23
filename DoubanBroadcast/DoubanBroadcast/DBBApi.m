//
//  DBBApi.m
//  DoubanBroadcast
//
//  Created by Zack on 22/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import "DBBApi.h"
#import <libDoubanApiEngine/DOUAPIEngine.h>

@implementation DBBApi

- (NSMutableDictionary *)userInfo
{
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"userInfo" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonFilePath];
    NSError *error;
    userInfo = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    
    return userInfo;
}

- (NSURL *)makeRequestURL
{
    NSString *str = [NSString stringWithFormat:@"https://www.douban.com/service/auth2/auth?client_id=%@&redirect_uri=%@&response_type=code", kAPIKey,kRedirectUrl];
    NSString *urlStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    return url;
}

- (NSDictionary *)fetchUserNeighboursBroadcast
{
    NSString *urlStr = [@"shuo/v2/statuses/home_timeline" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:urlStr parameters:nil];
    
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        
        NSLog(@"code:%d, str:%@", [req responseStatusCode], [req responseString]);
        NSError *theError = [req doubanError];
        if (!theError) {
            NSLog(@"发送成功");
        }
        else {
            NSLog(@"%@", theError);
        }
        
    };
    DOUService *service = [DOUService sharedInstance];
    [service get:query callback:completionBlock];
    return nil;
}
@end
