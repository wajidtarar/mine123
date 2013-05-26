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
    
    checkBoxSelected1 = NO;
    
//    self.checkBoxSelected = [NSNumber numberWithInt:0];
//    [_kBOX setBackgroundImage:[UIImage imageNamed:@"uncheck.png"]
//                     forState:UIControlStateNormal];
//    [_kBOX setBackgroundImage:[UIImage imageNamed:@"uncheck.png"]
//                        forState:UIControlStateNormal];
//    [_kBOX setBackgroundImage:[UIImage imageNamed:@"check.png"]
//                        forState:UIControlStateSelected];
//    [_kBOX setBackgroundImage:[UIImage imageNamed:@"uncheck.png"]
//                        forState:UIControlStateHighlighted];
//    
//    _kBOX.adjustsImageWhenHighlighted=YES;
////    [checkbox addTarget.....]
//    [self. addSubview:_kBOX];
    
    
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
- (IBAction)checkBoxButtonAction:(id)sender {
    
    NSLog(@"");
    
//    checkBoxSelected1 = !checkBoxSelected1;
//    [_kBOX setSelected:checkBoxSelected1];
//
//    
//    if(!checkBoxSelected){
//        [_kBOX setImage:[UIImage imageNamed:@"uicheckbox_unchecked.png"]
//                            forState:UIControlStateNormal];
//    }
//    else{
//        [_kBOX setImage:[UIImage imageNamed:@"uicheckbox_checked.png"]
//                            forState:UIControlStateNormal];
//    }
    

}
@end
