//
//  SimpleTableCell.m
//  hello-world1
//
//  Created by Maria on 4/27/13.
//  Copyright (c) 2013 Maria&Shiran. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell

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

@end
