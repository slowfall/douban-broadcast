//
//  DBBWebLoginViewController.h
//  DoubanBroadcast
//
//  Created by Zack on 23/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <libDoubanApiEngine/DOUOAuthService.h>

@interface DBBWebLoginViewController : UIViewController<UIWebViewDelegate, DOUOAuthServiceDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *loginWebView;

@end
