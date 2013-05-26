//
//  RootViewController.h
//  ScrollViews
//
//  Created by EmblemTech on 09/05/2013.
//  Copyright (c) 2013 Swipe Stack Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface RootViewController : UIViewController<UIScrollViewDelegate>

{
    AppDelegate *appDelegate;

    int pageNumber;
    CGRect  viewFrame;
}


@property (nonatomic, retain) IBOutlet UIScrollView *imageScrollView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (id)initWithPageNumber:(int)page andFrame:(CGRect)aFrame;



@end
