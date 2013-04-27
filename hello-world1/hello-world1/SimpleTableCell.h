//
//  SimpleTableCell.h
//  hello-world1
//
//  Created by Maria on 4/27/13.
//  Copyright (c) 2013 Maria&Shiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
    @property (nonatomic, weak) IBOutlet UILabel *nameLabel;
    @property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
    @property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;   
@end
