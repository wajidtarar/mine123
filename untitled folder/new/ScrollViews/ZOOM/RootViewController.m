//
//  RootViewController.m
//  ScrollViews
//
//  Created by EmblemTech on 09/05/2013.
//  Copyright (c) 2013 Swipe Stack Ltd. All rights reserved.
//

#import "RootViewController.h"

#define ZOOM_VIEW_TAG 100
#define ZOOM_STEP 1.5










@interface RootViewController ()
@property (nonatomic, strong) NSArray *pageImages;


- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;
@end


@implementation RootViewController

@synthesize imageScrollView, imageView;

@synthesize pageImages = _pageImages;

// load the view nib and initialize the pageNumber ivar
- (id)initWithPageNumber:(int)page andFrame:(CGRect)aFrame
{
    if (self = [super init])
    {
        pageNumber = page;
        viewFrame = aFrame;
        self.view.frame = viewFrame;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    self.pageImages = [appDelegate imagesArrayDetails ];
    
    
    UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    mainScrollView.pagingEnabled = YES;
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    
    //CGRect innerScrollFrame = mainScrollView.bounds;
    CGRect innerScrollFrame;
    float x = 0;
    for (NSInteger i = 0; i < [self.pageImages count]; i++) {
        //        for (NSInteger i = 0; i < 4; i++) {
        
        //        UIImageView *imageForZooming = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"photo%d.png", i + 1]]];
        UIImage *image = [self.pageImages objectAtIndex:i];
        UIImageView *imageForZooming = [[UIImageView alloc] initWithImage: image];
        imageForZooming.contentMode = UIViewContentModeScaleAspectFit;
        imageForZooming.tag = 100;
        innerScrollFrame = CGRectMake(x, imageForZooming.frame.origin.y, 320, 400);
        imageForZooming.frame =CGRectMake(0, 0, 320, 400);;
        UIScrollView *pageScrollView = [[UIScrollView alloc] initWithFrame:innerScrollFrame];
        pageScrollView.minimumZoomScale = 1.0f;
        pageScrollView.maximumZoomScale = 2.0f;
        pageScrollView.zoomScale = 1.0f;
        //  pageScrollView.contentSize = imageForZooming.bounds.size;
        pageScrollView.delegate = self;
        pageScrollView.showsHorizontalScrollIndicator = NO;
        pageScrollView.showsVerticalScrollIndicator = NO;
        [pageScrollView addSubview:imageForZooming];
        
        [mainScrollView addSubview:pageScrollView];
        
        //if (i < 2) {
        x += innerScrollFrame.size.width;
        //}
    }
    
    mainScrollView.contentSize = CGSizeMake(innerScrollFrame.origin.x + innerScrollFrame.size.width, mainScrollView.bounds.size.height);
    
    [self.view addSubview:mainScrollView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"called");
    return [scrollView viewWithTag:100];
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}


@end
