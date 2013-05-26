//
//  formCell1.h
//  KC BLAST
//
//  Created by Waqar on 5/26/13.
//  Copyright (c) 2013 Swipe Stack Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface formCell1 : UITableViewCell
{
    bool checkBoxSelected1;
}


@property (weak, nonatomic) IBOutlet NSNumber *checkBoxSelected;
@property (strong, nonatomic) IBOutlet UIButton *kBOX;

//for labels
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

- (IBAction)checkBoxButtonAction:(id)sender;


@end
