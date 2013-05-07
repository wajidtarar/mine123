//
//  KeyPicturesViewController.m
//  TraitWare
//
//  Created by Ruvato on 15/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "KeyPicturesViewController.h"
#import "PhotosClass.h"
#import "ImageCollectionViewCell.h"
#import "CommonMethods.h"
#import "SVProgressHUD.h"


#import "PagedScrollViewController.h"
#import "AppDelegate.h"


@interface KeyPicturesViewController ()

@end

@implementation KeyPicturesViewController

#pragma mark ViewActions
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
    

    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    
    NSLog(@"%@",[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] );
    NSString *lable = @"four";
    if([[[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] objectForKey:@"keyLength"] intValue]==6)
    {
        lable = @"six";
    }
    else if([[[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] objectForKey:@"keyLength"] intValue]==5)
    {
        lable = @"five";
    }
    if([CommonMethods getValueFromUserDefaultForKey:@"photoAuthKey"] != nil)
    {
        
        self.detailLable.text = [NSString stringWithFormat:@"Please select %@ pictures, in the same order as your current key to unlock",lable];
    }
    else
    {
        self.detailLable.text = [NSString stringWithFormat:@"Please select %@ pictures, remembering the order in which they are chosen",lable];
    }
    
    [SVProgressHUD show];
    apiManager = [[WebServicesManager alloc] init];
    apiManager.delegate = self;
    //[apiManager registerDeviceAndCreateSession];
    //[self performSelectorInBackground:@selector(loadDataInBackground) withObject:nil];
    [self.continueBtn setImage:[UIImage imageNamed:@"continueBtnDisable.png"] forState:UIControlStateDisabled];
    [self.continueBtn setImage:[UIImage imageNamed:@"continueBtnUnSelected.png"] forState:UIControlStateNormal];

    [self.resetBtn setImage:[UIImage imageNamed:@"reloadBtnUnSelected.png"] forState:UIControlStateDisabled];
    [self.resetBtn setImage:[UIImage imageNamed:@"reloadBtnSelected.png"] forState:UIControlStateHighlighted];
    
    self.PicturesCollectionView.delegate = self;
    self.PicturesCollectionView.dataSource = self;
    objPhotosArray = [[NSMutableArray alloc] init];
//    for (int i = 0; i<72; i++) {
//        
//        PhotosClass *photo = [[PhotosClass alloc] init];
//        photo.photoUuid = [NSString stringWithFormat:@"%d",i];
//        photo.href = @"Background.png";//[NSString stringWithFormat:,i];
//        photo.photoId = [NSString stringWithFormat:@"%d",i];
//        photo.photo = [UIImage imageNamed:@"Background.png"];
//        [objPhotosArray addObject:photo];
//        
//    }
    photoKey = [[NSMutableArray alloc] init];
    self.PicturesCollectionView.allowsMultipleSelection = YES;
    [CommonMethods setUpPageController:self.pageController size:objPhotosArray.count];
}

-(void)viewWillAppear:(BOOL)animated
{
//    [photoKey removeAllObjects];
//    [self.PicturesCollectionView reloadData];
//    self.continueBtn.enabled = NO;
    
//    [apiManager getPhotoAuthImagesList: self.stringToAppend];

    
}

-(void)viewDidAppear:(BOOL)animated
{
    //    [photoKey removeAllObjects];
    //    [self.PicturesCollectionView reloadData];
    //    self.continueBtn.enabled = NO;
    
    if(![self.stringToAppend isEqualToString:@""]){
        [apiManager getPhotoAuthImagesList: self.stringToAppend];
        self.stringToAppend = @"";
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"KeyPhotoConfirmationView" ])
    {
        
        keyPhotoConfirmViewController *objSelectedPhoto = segue.destinationViewController;
        objSelectedPhoto.delegate = self;
        objSelectedPhoto.objPhotosArray = objPhotosArray;
        objSelectedPhoto.selectedRow1 = [NSNumber numberWithInt: selectedRow];
        NSLog(@"objSelectedPhoto.selectedRow1: %@", [objSelectedPhoto.selectedRow1  stringValue] );
        
    } else if([segue.identifier isEqualToString:@"pagedView" ])
    {
        
//        PagedScrollViewController *objSelectedPhoto = segue.destinationViewController;
       // PagedScrollViewController.delegate = self;
//        objSelectedPhoto.pageImages1 = objPhotosArray;
//        PagedScrollViewController = photoKey;
        
        
    }
}
#pragma mark UiCollectionViewDelegates

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return objPhotosArray.count;
    NSLog(@"numberOfItemsInSection: %i", [appDelegate.imagesLinks count]);
    return [appDelegate.imagesLinks count];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    

    NSString *baseUrl = @"http://kcblastapp.com/getImage.php?img=";

    ImageCollectionViewCell *cell = (ImageCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    NSString *baseUrl = @"http://kcblastapp.com/getImage.php?img=upload/images/9-29 Back 2 School Comedy.jpg&type=";
//    NSString *baseUrl = @"http://kcblastapp.com/getImage.php?img=";
//
//    NSString *endAppend = @"&type=image";
//   
//    UIImage * result;
//    NSMutableString *urlString =[NSMutableString stringWithFormat:@"%@%@&type=thumb", baseUrl,
//                                 [appDelegate.imagesLinks objectAtIndex:indexPath.row]];
////    [appDelegate.imagesLinks objectAtIndex:indexPath.row];
//    NSLog(@"urlString: %@", urlString);
//    NSString* escapedUrl = [urlString
//                            stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString: escapedUrl]];
//    NSLog(@"escapedUrl: %@", escapedUrl);
//
//    result = [UIImage imageWithData:data];
////    UIImage *img = [[UIImage alloc] initWithData:data cache:NO];
//
//    
//    if(data == nil){
//        NSLog(@"data: nil nil nil");
//
//    } else{
//        NSLog(@"data:  ok ok ok");
//
//    }
//    cell.KeyImage.image = result;
//    
//    NSLog(@"imagesArray count: %i", [appDelegate.imagesArray count]);
//
//    UIImage *img = [[UIImage alloc] initWithData:data];
//
//    if(img == nil){
//        NSLog(@"img: nil nil nil");
//        
//    } else{
//        NSLog(@"img:  ok ok ok");
//        
//    }
//    [appDelegate.imagesArray addObject:img];
//    NSLog(@"imagesArray count: %i", [appDelegate.imagesArray count]);
//    NSLog(@"imagesArray count: %i", [appDelegate.imagesArray count]);

//    if(data == nil){
//        NSLog(@"urlString: nil nil nil");
//        
//    } else{
//        NSLog(@"cellForItemAtIndexPath:  ok ok ok");
//        
//    }
    
    
//    NSMutableString *urlString1 =[NSMutableString stringWithFormat:@"%@%@&type=thumb", baseUrl,
//                                  [appDelegate.imagesLinks objectAtIndex:indexPath.row]];
    
    NSMutableString *urlString1 =[NSMutableString stringWithFormat:@"%@%@&type=thumb", baseUrl,
                                  [appDelegate.imagesLinks objectAtIndex:indexPath.row]];
    NSString* escapedUrl1 = [urlString1
                            stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];       // PhotosClass *objPhoto = [objPhotosArray objectAtIndex:indexPath.row];
//        if(objPhoto.photo ==nil)
        if((NSNull*)[appDelegate.imagesArray objectAtIndex:indexPath.row]
           == [NSNull null])
        {
//            cell.KeyImage.image = [UIImage imageNamed:@"placeholder.png"];
            NSMutableArray *data = [NSMutableArray arrayWithObjects:escapedUrl1,indexPath, nil];
            [self performSelectorInBackground:@selector(loadImageInBackground:) withObject:data];
        }
        else
        {
            cell.KeyImage.image = [appDelegate.imagesArray objectAtIndex:indexPath.row];
        }
        //cell.imageId = objPhoto.photoUuid;
        cell.isSelected = NO;
        //cell.BadgeImage.image = nil;
//        if(photoKey.count > 0)
//        {
//            for (int i = 0; i<photoKey.count; i++) {
//                
//                if([[photoKey objectAtIndex:i] isEqualToString:objPhoto.photoUuid])
//                {
//                    cell.isSelected = YES;
//                    cell.BadgeImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image0%d.png",i+1]];
//                }
//                
//                
//            }
//                
//            
//        }
    
    return cell;
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    
    return UIEdgeInsetsMake(5, 10, 5, 10);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"pagedView" sender:self];

    selectedRow = indexPath.row;
//    [self performSegueWithIdentifier:@"KeyPhotoConfirmationView" sender:self];
//
//    [self.PicturesCollectionView deselectItemAtIndexPath:indexPath animated:NO];
//    ImageCollectionViewCell *cell = (ImageCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
//    if(photoKey.count < [[[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] objectForKey:@"keyLength"] intValue])
//    {
//       
//        cell.isSelected = YES;
//        [photoKey addObject:cell.imageId];
//        cell.BadgeImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image0%d.png",photoKey.count]];
//    }
//   
//    if(photoKey.count >=[[[CommonMethods getValueFromUserDefaultForKey:@"photoAuthSettings"] objectForKey:@"keyLength"] intValue])
//    {
//        self.continueBtn.enabled = YES;
//
//    }

    
   
    
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.PicturesCollectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];

}
#pragma mark Actions
- (IBAction)ResetSelection:(id)sender {
    [photoKey removeAllObjects];
    [self.PicturesCollectionView reloadData];
}

- (IBAction)ContinueAction:(id)sender {
    
    if([CommonMethods getValueFromUserDefaultForKey:@"photoAuthKey"] != nil){
        
        NSMutableArray *savedKey = [CommonMethods getValueFromUserDefaultForKey:@"photoAuthKey"];
        for(NSString *photoId in photoKey)
        {
            
            for (int i=0; i<savedKey.count; i++) {
                
                //NSLog(@"for i = %i", i);
                if(![[photoKey objectAtIndex:i] isEqualToString:[savedKey objectAtIndex:i]])
                {
                    [CommonMethods showAlert:@"Message" message:@"PhotoAuth Mismatch - Try Again"];
                    
                    [photoKey removeAllObjects];
                    [self.PicturesCollectionView reloadData];
                    return;
                }
            }
        }
        
         [self performSegueWithIdentifier:@"MainTabController" sender:self];

        
    } else{
        [self performSegueWithIdentifier:@"KeyPhotoConfirmationView" sender:self];
    }
   
    
}
#pragma mark scrollviewDelegates
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    CGFloat pageWidth = self.PicturesCollectionView.frame.size.width;
    int page = lroundf(self.PicturesCollectionView.contentOffset.x / pageWidth);
     NSLog(@"currentPage:%d",page);
    self.pageController.currentPage = page;
    
}
#pragma mark HelpingMethods
-(BOOL)containKey:(NSString *)pId
{
    for(NSString *photoId in photoKey)
    {
        if([photoId isEqualToString:pId])
        {
            //NSLog(@"photoId %@ key%@",photoId,pId);
            return YES;
        }
    }
    return NO;
}
-(void)loadDataInBackground
{
    [apiManager getPhotoAuthImagesList: nil];
}
-(void)loadImageInBackground:(id)data
{
    [apiManager getPhotoAuthImage:[data objectAtIndex:0] forIndexPath:[data objectAtIndex:1]];
}
#pragma mark keyConfirmationViewDelegate
-(void)callKeyControllView:(BOOL)type
{
    [photoKey removeAllObjects];
    [self.PicturesCollectionView reloadData];
   // [self dismissViewControllerAnimated:NO completion:nil ];
}
#pragma mark WebServiceManagerDelegate
-(void)imagesFetch:(NSMutableArray *)imagesArray response:(BOOL)response
{
    [SVProgressHUD dismiss];
    if(response)
    {
        for (NSInteger i = 0; i < [appDelegate.imagesLinks count]; ++i) {
            [appDelegate.imagesArray addObject:[NSNull null]];
        }
        objPhotosArray = imagesArray;
        [CommonMethods setUpPageController:self.pageController size:objPhotosArray.count];
        [self.PicturesCollectionView reloadData];
    }
}
-(void)imageLoaded:(UIImage *)image forIndexPath:(NSIndexPath *)indexPath response:(BOOL)response
{
    if(response)
    {
        ImageCollectionViewCell *cell = (ImageCollectionViewCell*)[self.PicturesCollectionView cellForItemAtIndexPath:indexPath];
        cell.KeyImage.image = image;
        [appDelegate.imagesArray replaceObjectAtIndex:indexPath.row withObject:image];
    }
}

- (void)viewDidUnload {
    [self setPageController:nil];
    [super viewDidUnload];
}
@end
