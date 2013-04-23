//
//  LoginViewController.h
//  DoubanBroadcast
//
//  Created by Zack on 20/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <libDoubanApiEngine/DOUService.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@end
