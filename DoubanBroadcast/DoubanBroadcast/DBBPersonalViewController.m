//
//  DBBPersonalViewController.m
//  DoubanBroadcast
//
//  Created by Zack on 27/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import "DBBPersonalViewController.h"
#import "DBBPersonalInfoCell.h"

@interface DBBPersonalViewController ()
@property (strong, nonatomic) NSMutableDictionary *userInfoDic;
@property (nonatomic) NSString *currentValue;
@end

@implementation DBBPersonalViewController

- (void)setup
{
    self.userInfoDic = [[NSMutableDictionary alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"userInfo" ofType:@"xml"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSLog(@"row=%d", row);
    static NSString *CellIdentifier;
    if (row == 0) {
    CellIdentifier = @"DBBPersonalInfoCell";
    DBBPersonalInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        NSString *icon = [self.userInfoDic objectForKey:@"icon"];
        NSRange range = [icon rangeOfString:@"user_normal.jpg"];
        if (range.location != NSNotFound) {
            [cell.userImage setImage:[UIImage imageNamed:@"user_avatar_default.jpg"]];
        }
        return cell;
    }

    return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - xml parser delegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"link"]) {
        NSString *key, *value;
        key = [attributeDict objectForKey:@"rel"];
        value = [attributeDict objectForKey:@"href"];
        if ((key != nil) && (value != nil)) {
            [self.userInfoDic setObject:value forKey:key];
        }
    }
//    NSLog(@"START %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
//    NSLog(@"FOUND %@", string);
    self.currentValue = string;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
//    NSLog(@"END %@", elementName);
    [self.userInfoDic setObject:self.currentValue forKey:elementName];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
//    NSLog(@"%@", self.userInfoDic);
    [self.tableView reloadData];
}

@end
