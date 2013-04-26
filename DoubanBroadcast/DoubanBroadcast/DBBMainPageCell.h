//
//  DBBMainPageCell.h
//  DoubanBroadcast
//
//  Created by Zack on 25/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBBMainPageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentText;
- (IBAction)likeBtnPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
