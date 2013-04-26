//
//  DBBMainPageViewController.m
//  DoubanBroadcast
//
//  Created by Zack on 24/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import "DBBMainPageViewController.h"
#import "DBBMainPageCell.h"
#import "DBBApi.h"

@interface DBBMainPageViewController ()
@property (strong, nonatomic) DBBApi *dbbApi;
@end

@implementation DBBMainPageViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        NSLog(@"self init with style");
    }
    return self;
}

- (id)init
{
    self = [super init];
        NSLog(@"self init");
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"in dbb main page, did load");
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
    if (self.dbbApi == nil) {
        self.dbbApi = [[DBBApi alloc] init];
        self.userInfoArray = [self.dbbApi fetchUserNeighboursBroadcast];
        NSLog(@"%@", self.userInfoArray);
    }
    // Return the number of rows in the section.
    NSLog(@"number of rows=%lu",(unsigned long)[self.userInfoArray count]);
    return [self.userInfoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MainPageCell";
    DBBMainPageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSInteger row = [indexPath row];
    
    NSDictionary *dic = [self.userInfoArray objectAtIndex:row];
    NSLog(@"in table view cell for row %u at index path=%@", row, dic);
    cell.titleLabel.text = [dic valueForKey:@"title"];
    cell.contentText.text =[dic valueForKey:@"text"];
    cell.timeLabel.text = [dic valueForKey:@"created_at"];
    NSDictionary *userDic = [dic valueForKey:@"user"];
    cell.nameLabel.text = [userDic valueForKey:@"screen_name"];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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

@end
