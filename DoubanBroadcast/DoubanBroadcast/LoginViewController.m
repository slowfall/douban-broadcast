//
//  LoginViewController.m
//  DoubanBroadcast
//
//  Created by Zack on 20/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(id)sender {
}

- (IBAction)backgroundTap:(id)sender {
    [self.nameField resignFirstResponder];
    [self.pwdField resignFirstResponder];
}

- (IBAction)loginPressed:(id)sender
{
    NSLog(@"%@", self.nameField.text);
    if(self.nameField.text) {
        [self performSegueWithIdentifier:@"login" sender:self];
    } else {
        NSLog(@"no name.");
    }
}

@end
