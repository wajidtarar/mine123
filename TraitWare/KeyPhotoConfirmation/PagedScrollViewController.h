//
//  PagedScrollViewController.h
//  TraitWare
//
//  Created by Waqar on 5/5/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagedScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;

@end
