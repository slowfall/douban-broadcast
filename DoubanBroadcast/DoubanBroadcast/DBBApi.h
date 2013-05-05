//
//  DBBApi.h
//  DoubanBroadcast
//
//  Created by Zack on 22/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString * const kAPIKey = @"01078b207383c5510316a1615a8b4ff3";
static NSString * const kPrivateKey = @"fade1696d036c642";
static NSString * const kRedirectUrl = @"http://www.douban.com/location/mobile";

@interface DBBApi : NSObject
- (NSMutableDictionary *)userInfo;
- (NSURL *)makeRequestURL;
- (NSArray *)fetchUserNeighboursBroadcast;
- (void)fetchOAuthUserInfo:(id) delegate;
@end
