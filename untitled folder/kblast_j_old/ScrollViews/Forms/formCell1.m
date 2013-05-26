//
//  formCell1.m
//  KC BLAST
//
//  Created by Waqar on 5/26/13.
//  Copyright (c) 2013 Swipe Stack Ltd. All rights reserved.
//

#import "formCell1.h"

@implementation formCell1

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    checkBoxSelected1 = false;
//    self.checkBoxSelected = [NSNumber numberWithBool:NO];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)checkBoxButtonAction:(id)sender {
    
    NSLog(@"");
    
//    checkBoxSelected1 = !checkBoxSelected1;
//    [_kBOX setSelected:checkBoxSelected1];
}

@end
