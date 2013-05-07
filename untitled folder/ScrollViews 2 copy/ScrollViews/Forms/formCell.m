//
//  formCell.m
//  TraitWare
//
//  Created by Waqar on 5/1/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "formCell.h"

@implementation formCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateNormal];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)kBocAction:(id)sender {
    //NSLog(@"skmvkjnjkn");
}

- (IBAction)cBoxAction:(id)sender {
    //NSLog(@"skmvkjnjkn");

}
@end
