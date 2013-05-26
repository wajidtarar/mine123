//
//  FormViewController.h
//  TraitWare
//
//  Created by Waqar on 5/1/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICheckbox.h"
#import "WebServicesManager.h"

@interface FormViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,
                                UITextFieldDelegate, WebServicesManagerDelegate>
{
    WebServicesManager *apiManager;
    NSString *stringToAppend;
}


@property (weak, nonatomic) IBOutlet UITableView *formsTable;
//@property (weak, nonatomic) IBOutlet UIButton *checkButton;
- (IBAction)checkButtonAction:(id)sender;
//for storing form data
@property (strong, nonatomic) IBOutlet NSMutableArray *agesArray;
@property (strong, nonatomic) IBOutlet NSMutableArray *eventsArray;
@property (strong, nonatomic) IBOutlet NSMutableArray *agesSelectedArray;
@property (strong, nonatomic) IBOutlet NSMutableArray *eventsSelectedArray;

//for search button
- (IBAction)searchAction:(id)sender;

//for searching text fied
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
- (IBAction)cBoxAction:(id)sender;
- (IBAction)cBoxAction1:(id)sender;



@end
