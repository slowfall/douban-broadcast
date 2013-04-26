//
//  DBBMainPageCell.m
//  DoubanBroadcast
//
//  Created by Zack on 25/4/13.
//  Copyright (c) 2013 Banana Inc. All rights reserved.
//

#import "DBBMainPageCell.h"

@implementation DBBMainPageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)likeBtnPressed:(id)sender {
}
@end
