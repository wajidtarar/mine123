
    //
//  FormViewController.m
//  TraitWare
//
//  Created by Waqar on 5/1/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "FormViewController.h"
#import "formCell.h"

#import "KeyPicturesViewController.h"
#import "SVProgressHUD.h"


@interface FormViewController ()

@end

@implementation FormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateNormal];
    self.agesArray = [[NSMutableArray alloc] initWithObjects:@"Under 18",@"18-21",@"21-25",@"25-30",@"30-35",@"35+", nil];
    self.eventsArray = [[NSMutableArray alloc] initWithObjects:@"Club Event",@"Concert",@"Comedy",@"Family/Community",@"Religious",@"Sports", nil];
    id num = [NSNumber numberWithBool:0];
    self.eventsSelectedArray = [[NSMutableArray alloc] initWithObjects:num,num,num,num,num,num, nil];
    self.agesSelectedArray = [[NSMutableArray alloc] initWithObjects:num,num,num,num,num,num, nil];

    //.agesSelectedArray = [[NSMutableArray alloc] initWithCapacity:6];
    
    
    
    self.formsTable.delegate = self;
    self.formsTable.dataSource = self;
    self.searchTextField.delegate = self;
	// Do any additional setup after loading the view.
    
    apiManager = [[WebServicesManager alloc] init];
    apiManager.delegate = self;
    
    //[self.checkButton setTitle:@"ppwpdoppokp" forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark TableViewDelegates



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 6;
    else
        return 6;
    //return [objTransactions count];
}

//RootViewController.m
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(section == 0)
        return @"Select Age Group";
    else
        return @"Event Type";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

	formCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:@"formCell"];
   
    if(cell == nil ){
        NSLog(@"cell == nil ");
    }else{
        //NSLog(@"cell != nil: %i", indexPath.section);
        
    }
    
//    [self.checkButton setTitle:@"ppwpdoppokp" forState:UIControlStateNormal];
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_unchecked.png"] forState:UIControlStateNormal];
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_unchecked.png"] forState:UIControlStateHighlighted];

    if(indexPath.section == 0){
        cell.cellLabel.text = [self.agesArray objectAtIndex:indexPath.row];
    }else{
        cell.cellLabel.text = [self.eventsArray objectAtIndex:indexPath.row];
    }
    //	Player *player = [self.players objectAtIndex:indexPath.row];
    //	cell.textLabel.text = player.name;
    //	cell.detailTextLabel.text = player.game;
    //NSLog(@" cell.checkButton.titleLabel.text: %@",  cell.checkButton.titleLabel.text);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    formCell *cell = (formCell*)[tableView cellForRowAtIndexPath:indexPath] ;

    //Get the
//    NSLog(@"didSelectRowAtIndexPath row = %i section= %i", indexPath.section, indexPath.row);
    //UITableViewCell *cell = (formCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"didSelectRowAtIndexPath section = %i row = %i", indexPath.section, indexPath.row);

    
}



- (IBAction)checkButtonAction:(id)sender {
    NSIndexPath *indexPath =
    [self.formsTable
     indexPathForCell:(UITableViewCell *)[[sender superview] superview]];
    
//    self.checkButton.enabled = NO;
//    [self.checkButton setEnabled:NO];
    
//    NSLog(@"checkButtonAction row = %i", indexPath.row);
//    NSLog(@"checkButtonAction section = %i", indexPath.section);

    //[self.checkButton setBackgroundImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateHighlighted];
    //[self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateNormal];
    
//    NSLog(@"checkButtonAction tirle = %@", self.checkButton.titleLabel.text);

//    cell.checkButton.titleLabel.text = @"oohhh";
//

    //    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateNormal];

//    cell.checkButton.titleLabel.text = @"xyz";
//    NSLog(@"checkButtonAction title = %@", self.checkButton.titleLabel.text);
    

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    

    if([segue.identifier isEqualToString:@"keyPhotoView" ])
    {
        
        KeyPicturesViewController *objSelectedPhoto = segue.destinationViewController;
       // objSelectedPhoto.delegate = self;
        objSelectedPhoto.stringToAppend = stringToAppend;
        //objSelectedPhoto.lastKey = photoKey;
        
        
        
    }
}
#pragma mark TextFieldDelegates

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)searchAction:(id)sender {
    
    [SVProgressHUD show];

    [self getIdeas];
  
   // searchImage.php?keyWord=e&ageGroup=1,2,3&eventId=1,2,3,5

    NSString *keyWord = self.searchTextField.text;
    
    stringToAppend = [NSString stringWithFormat:
                                @"searchImage.php?keyWord=%@&ageGroup=%@&eventId=%@", keyWord, [self getAges], [self getEvents]];
    
    NSLog(@"stringToAppend: %@", stringToAppend);

    [self performSegueWithIdentifier:@"keyPhotoView" sender:self];

    //[apiManager getPhotoAuthImagesList: stringToAppend];

    
}




- (IBAction)cBoxAction:(id)sender {
    //NSLog(@"cBoxAction cBoxAction");
    
    [self getIdeas];
    NSIndexPath *indexPath =
    [self.formsTable indexPathForCell:(formCell *)[[sender superview] superview]];
    NSUInteger row = indexPath.row;
    NSUInteger section = indexPath.section;

    //NSLog(@"cBoxAction row: %i section: %i", row, section);

    
    formCell *cell = (formCell*)[self.formsTable cellForRowAtIndexPath:indexPath] ;
    if(cell!=nil && section == 0){
       // NSLog(@"!nil");

        if(cell.kBOX.checked){
           // NSLog(@"selected");
            [self.agesSelectedArray replaceObjectAtIndex:row withObject:[NSNumber numberWithBool:1]];
        } else{
            [self.agesSelectedArray replaceObjectAtIndex:row withObject:[NSNumber numberWithBool:0]];
        }

    }else if(cell!=nil && section == 1){
        //NSLog(@"!nil");
        if(cell.kBOX.checked){
            //NSLog(@"selected");
            [self.eventsSelectedArray replaceObjectAtIndex:row withObject:[NSNumber numberWithBool:1]];
        } else{
            [self.eventsSelectedArray replaceObjectAtIndex:row withObject:[NSNumber numberWithBool:0]];
        }
        
    }
    
    [self getIdeas];

    
}

-(NSString*) getAges
{
    Boolean flag = true;
    NSMutableString *ageGroupString = [NSMutableString stringWithFormat:@""];
    
    for(int i = 0;i < 6;i = i + 1)
    {
        if (flag && [[self.agesSelectedArray objectAtIndex:i ] boolValue]) {
            [ageGroupString appendFormat:@"%i", i+1];
            flag = false;
        }else if (!flag && [[self.agesSelectedArray objectAtIndex:i] boolValue]) {
            [ageGroupString appendFormat:@",%i", i+1];
        }
    }
    
    NSLog(@"ageGroupString=%@", ageGroupString);
    return ageGroupString;
}

-(NSString*) getEvents
{
    Boolean flag1 = true;
    NSMutableString *eventsGroupString = [NSMutableString stringWithFormat:@""];
    
    for(int i = 0;i < 6;i = i + 1)
    {
        if (flag1 && [[self.eventsSelectedArray objectAtIndex:i] boolValue]) {
            [eventsGroupString appendFormat:@"%i", i+1];
            flag1 = false;
        }else if (!flag1 && [[self.eventsSelectedArray objectAtIndex:i]boolValue]) {
            [eventsGroupString appendFormat:@",%i", i+1];
        }
        
        
    }
    
    NSLog(@"eventsGroupString%@", eventsGroupString);
    return eventsGroupString;
}

-(void) getIdeas
{
    Boolean flag = true;
    NSMutableString *ageGroupString = [NSMutableString stringWithFormat:@""];
    
    for(int i = 0;i < 6;i = i + 1)
    {
        if (flag && [[self.agesSelectedArray objectAtIndex:i ] boolValue]) {
            [ageGroupString appendFormat:@"%i", i];
            flag = false;
        }else if (!flag && [[self.agesSelectedArray objectAtIndex:i] boolValue]) {
            [ageGroupString appendFormat:@",%i", i];
        }
        
        
    }
    
    Boolean flag1 = true;
    NSMutableString *eventsGroupString = [NSMutableString stringWithFormat:@""];
    
    for(int i = 0;i < 6;i = i + 1)
    {
        if (flag1 && [[self.eventsSelectedArray objectAtIndex:i] boolValue]) {
            [eventsGroupString appendFormat:@"%i", i];
            flag1 = false;
        }else if (!flag1 && [[self.eventsSelectedArray objectAtIndex:i]boolValue]) {
            [eventsGroupString appendFormat:@",%i", i];
        }
        
        
    }
    
    NSLog(@"ageGroupString=%@ , eventsGroupString%@", ageGroupString, eventsGroupString);
}

@end
