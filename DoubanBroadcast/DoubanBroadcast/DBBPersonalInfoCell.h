//
//  DBBPersonalInfoCell.h
//  DoubanBroadcast
//
//  Created by Zack on 3/5/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBBPersonalInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;

@end
