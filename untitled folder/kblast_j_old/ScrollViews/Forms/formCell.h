//
//  formCell.h
//  TraitWare
//
//  Created by Waqar on 5/1/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICheckbox;

@interface formCell : UITableViewCell
{
    BOOL checkBoxSelected1;

}

@property (strong, nonatomic) IBOutlet NSNumber *checkBoxSelected;


@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;

- (IBAction)checkBoxAction:(id)sender;
//@property (weak, nonatomic) IBOutlet UIButton *checkButton;

//@property (weak, nonatomic) IBOutlet UICheckbox *kBOX;
@property (weak, nonatomic) IBOutlet UIButton *kBOX;

- (IBAction)kBocAction:(id)sender;
- (IBAction)cBoxAction:(id)sender;
//for labels
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

- (IBAction)checkBoxButtonAction:(id)sender;

@end
