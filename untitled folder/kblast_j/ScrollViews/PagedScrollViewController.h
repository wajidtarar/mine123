//
//  PagedScrollViewController.h
//  ScrollViews
//
//  Created by Matt Galloway on 01/03/2012.
//  Copyright (c) 2012 Swipe Stack Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface PagedScrollViewController : UIViewController <UIScrollViewDelegate>
{
    AppDelegate *appDelegate;
    
    int pageNumber;
    CGRect  viewFrame;

}
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) IBOutlet NSNumber *pageToShow;



- (id)initWithPageNumber:(int)page andFrame:(CGRect)aFrame;


@end
