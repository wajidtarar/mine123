//
//  keyPhotoConfirmViewController.h
//  TraitWare
//
//  Created by Ruvato on 19/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServicesManager.h";

#import "AppDelegate.h"

@class keyPhotoConfirmViewController;
@protocol keyPhotoConfirmViewControllerDelegate <NSObject>

-(void)callKeyControllView:(BOOL)type;

@end

@interface keyPhotoConfirmViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,WebServicesManagerDelegate,UIScrollViewDelegate>
{
    AppDelegate *appDelegate;
    
    NSMutableArray *photoKey;
    BOOL popView;
    WebServicesManager *apiManager;
     NSInteger _tryNumber;
    
//    NSInteger selectedRow;
    
}
- (IBAction)ResetSelection:(id)sender;
- (IBAction)ContinueAction:(id)sender;
@property (strong, nonatomic) id<keyPhotoConfirmViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITextView *MsgTextView;
@property (weak, nonatomic) IBOutlet UICollectionView *PicturesCollectionView;
//@property (strong, nonatomic)NSNumber *lastKey;
@property (weak, nonatomic)IBOutlet NSNumber *selectedRow1;

@property (weak, nonatomic) IBOutlet UIButton *continueBtn;
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;
@property (strong,nonatomic)NSMutableArray *objPhotosArray;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController1;

@property (weak, nonatomic) IBOutlet UILabel *headerLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLable;


@end
