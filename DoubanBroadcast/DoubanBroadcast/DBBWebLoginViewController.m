//
//  DBBWebLoginViewController.m
//  DoubanBroadcast
//
//  Created by Zack on 23/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import "DBBWebLoginViewController.h"
#import <libDoubanApiEngine/DOUAPIEngine.h>
#import "DBBApi.h"

@interface NSString (ParseCategory)
- (NSMutableDictionary *)explodeToDictionaryInnerGlue:(NSString *)innerGlue
                                           outterGlue:(NSString *)outterGlue;
@end

@implementation NSString (ParseCategory)

- (NSMutableDictionary *)explodeToDictionaryInnerGlue:(NSString *)innerGlue
                                           outterGlue:(NSString *)outterGlue {
    // Explode based on outter glue
    NSArray *firstExplode = [self componentsSeparatedByString:outterGlue];
    NSArray *secondExplode;
    
    // Explode based on inner glue
    NSInteger count = [firstExplode count];
    NSMutableDictionary* returnDictionary = [NSMutableDictionary dictionaryWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        secondExplode =
        [(NSString*)[firstExplode objectAtIndex:i] componentsSeparatedByString:innerGlue];
        if ([secondExplode count] == 2) {
            [returnDictionary setObject:[secondExplode objectAtIndex:1]
                                 forKey:[secondExplode objectAtIndex:0]];
        }
    }
    return returnDictionary;
}

@end

@interface DBBWebLoginViewController ()
@property (strong, nonatomic) DBBApi *dbbApi;
@property (strong, nonatomic) NSURL *requestURL;
@end

@implementation DBBWebLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setup
{
    self.dbbApi = [[DBBApi alloc] init];
    self.requestURL = [self.dbbApi makeRequestURL];
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Web Login view did load");
    self.dbbApi = [[DBBApi alloc] init];
    self.requestURL = [self.dbbApi makeRequestURL];
    
    self.loginWebView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:self.requestURL];
    [self.loginWebView loadRequest:request];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *urlObj =  [request URL];
    NSString *url = [urlObj absoluteString];
    
    
    if ([url hasPrefix:kRedirectUrl]) {
        NSString* query = [urlObj query];
        NSMutableDictionary *parsedQuery = [query explodeToDictionaryInnerGlue:@"="
                                                                    outterGlue:@"&"];
        
        //access_denied
        NSString *error = [parsedQuery objectForKey:@"error"];
        if (error) {
            return NO;
        }
        
        //access_accept
        NSString *code = [parsedQuery objectForKey:@"code"];
        DOUOAuthService *service = [DOUOAuthService sharedInstance];
        service.authorizationURL = kTokenUrl;
        service.delegate = self;
        service.clientId = kAPIKey;
        service.clientSecret = kPrivateKey;
        service.callbackURL = kRedirectUrl;
        service.authorizationCode = code;
        
        [service validateAuthorizationCode];
        
        return NO;
    }
    
    return YES;
}

- (void)OAuthClient:(DOUOAuthService *)client didAcquireSuccessDictionary:(NSDictionary *)dic {
    [dic writeToFile:@"logininfo.plist" atomically:YES];
    DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
    [store updateWithSuccessDictionary:dic];
    [self performSegueWithIdentifier:@"webLogin" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

- (void)OAuthClient:(DOUOAuthService *)client didFailWithError:(NSError *)error {
    NSLog(@"Fail!");
}
@end
