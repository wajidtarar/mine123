////
////  PagedScrollViewController.m
////  ScrollViews
////
////  Created by Matt Galloway on 01/03/2012.
////  Copyright (c) 2012 Swipe Stack Ltd. All rights reserved.
////
//
//#import "PagedScrollViewController.h"
//
//@interface PagedScrollViewController ()
//@property (nonatomic, strong) NSArray *pageImages;
//@property (nonatomic, strong) NSMutableArray *pageViews;
//
//- (void)loadVisiblePages;
//- (void)loadPage:(NSInteger)page;
//- (void)purgePage:(NSInteger)page;
//
//
//
//@property (nonatomic, strong) UIImageView *imageView;
//
//- (void)centerScrollViewContents;
//- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer;
//- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer;
//
//
//
//@end
//
//@implementation PagedScrollViewController
//
//@synthesize scrollView = _scrollView;
//@synthesize pageControl = _pageControl;
//
//@synthesize pageImages = _pageImages;
//@synthesize pageViews = _pageViews;
//
//#pragma mark -
//
//- (void)loadVisiblePages {
//    // First, determine which page is currently visible
//    CGFloat pageWidth = self.scrollView.frame.size.width;
//    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
//    
//    // Update the page control
//    self.pageControl.currentPage = page;
//    
//    // Work out which pages we want to load
//    NSInteger firstPage = page - 1;
//    NSInteger lastPage = page + 1;
//    
//    // Purge anything before the first page
//    for (NSInteger i=0; i<firstPage; i++) {
//        [self purgePage:i];
//    }
//    for (NSInteger i=firstPage; i<=lastPage; i++) {
//        [self loadPage:i];
//    }
//    for (NSInteger i=lastPage+1; i<self.pageImages.count; i++) {
//        [self purgePage:i];
//    }
//}
//
//- (void)loadPage:(NSInteger)page {
//    if (page < 0 || page >= self.pageImages.count) {
//        // If it's outside the range of what we have to display, then do nothing
//        return;
//    }
//    
//    // Load an individual page, first seeing if we've already loaded it
//    UIView *pageView = [self.pageViews objectAtIndex:page];
//    if ((NSNull*)pageView == [NSNull null]) {
//        CGRect frame = self.scrollView.bounds;
//        frame.origin.x = frame.size.width * page;
//        frame.origin.y = 0.0f;
//        
//        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
//        newPageView.contentMode = UIViewContentModeScaleAspectFit;
//        newPageView.frame = frame;
//        self.imageView = newPageView;
//        [self.scrollView addSubview:newPageView];
//        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
//    }
//}
//
//- (void)purgePage:(NSInteger)page {
//    if (page < 0 || page >= self.pageImages.count) {
//        // If it's outside the range of what we have to display, then do nothing
//        return;
//    }
//    
//    // Remove a page from the scroll view and reset the container array
//    UIView *pageView = [self.pageViews objectAtIndex:page];
//    if ((NSNull*)pageView != [NSNull null]) {
//        [pageView removeFromSuperview];
//        [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
//    }
//}
//
//
//#pragma mark -
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.title = @"Paged";
//    
//    
//    
//    
//    // Set up the image we want to scroll & zoom and add it to the scroll view
//    self.pageImages = [NSArray arrayWithObjects:
//                       [UIImage imageNamed:@"photo1.png"],
//                       [UIImage imageNamed:@"photo2.png"],
//                       [UIImage imageNamed:@"photo3.png"],
//                       [UIImage imageNamed:@"photo4.png"],
//                       [UIImage imageNamed:@"photo5.png"],
//                       nil];
//    
//    //    self.pageImages = [appDelegate imagesArray];
//    
//    
//    //    self.imageView = newPageView;
//    // 1
//    //    UIImage *image = [UIImage imageNamed:@"photo1.png"];
//    
//    UIImage *image = [self.pageImages objectAtIndex:0];
//    self.imageView = [[UIImageView alloc] initWithImage:image];
//    self.imageView.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=image.size};
//    [self.scrollView addSubview:self.imageView];
//    
//    // 2
//    self.scrollView.contentSize = image.size;
//    
//    // 3
//    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDoubleTapped:)];
//    doubleTapRecognizer.numberOfTapsRequired = 2;
//    doubleTapRecognizer.numberOfTouchesRequired = 1;
//    [self.scrollView addGestureRecognizer:doubleTapRecognizer];
//    
//    UITapGestureRecognizer *twoFingerTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTwoFingerTapped:)];
//    twoFingerTapRecognizer.numberOfTapsRequired = 1;
//    twoFingerTapRecognizer.numberOfTouchesRequired = 2;
//    [self.scrollView addGestureRecognizer:twoFingerTapRecognizer];
//    
//    
//    
//    
//    NSInteger pageCount = self.pageImages.count;
//    
//    // Set up the page control
//    self.pageControl.currentPage = 0;
//    self.pageControl.numberOfPages = pageCount;
//    
//    // Set up the array to hold the views for each page
//    self.pageViews = [[NSMutableArray alloc] init];
//    for (NSInteger i = 0; i < pageCount; ++i) {
//        [self.pageViews addObject:[NSNull null]];
//    }
//}
//
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//    
//    [super viewWillAppear:animated];
//    
//    // 4
//    CGRect scrollViewFrame = self.scrollView.frame;
//    CGFloat scaleWidth = scrollViewFrame.size.width / self.scrollView.contentSize.width;
//    CGFloat scaleHeight = scrollViewFrame.size.height / self.scrollView.contentSize.height;
//    CGFloat minScale = MIN(scaleWidth, scaleHeight);
//    self.scrollView.minimumZoomScale = minScale;
//    
//    // 5
//    self.scrollView.maximumZoomScale = 1.0f;
//    self.scrollView.zoomScale = minScale;
//    
//    // 6
//    [self centerScrollViewContents];
//    
//    
//    
//    // Set up the content size of the scroll view
//    CGSize pagesScrollViewSize = self.scrollView.frame.size;
//    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
//    
//    // Load the initial set of pages that are on screen
//    [self loadVisiblePages];
//}
//
//- (void)viewDidUnload {
//    [super viewDidUnload];
//    
//    self.scrollView = nil;
//    self.pageControl = nil;
//    self.pageImages = nil;
//    self.pageViews = nil;
//}
//
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//}
//
//
//#pragma mark - UIScrollViewDelegate
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    // Load the pages which are now on screen
//    [self loadVisiblePages];
//}
//
//
//
//- (void)centerScrollViewContents {
//    CGSize boundsSize = self.scrollView.bounds.size;
//    CGRect contentsFrame = self.imageView.frame;
//    
//    if (contentsFrame.size.width < boundsSize.width) {
//        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
//    } else {
//        contentsFrame.origin.x = 0.0f;
//    }
//    
//    if (contentsFrame.size.height < boundsSize.height) {
//        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
//    } else {
//        contentsFrame.origin.y = 0.0f;
//    }
//    
//    self.imageView.frame = contentsFrame;
//}
//
//
//
//- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer {
//    // 1
//    CGPoint pointInView = [recognizer locationInView:self.imageView];
//    
//    // 2
//    CGFloat newZoomScale = self.scrollView.zoomScale * 1.5f;
//    newZoomScale = MIN(newZoomScale, self.scrollView.maximumZoomScale);
//    
//    // 3
//    CGSize scrollViewSize = self.scrollView.bounds.size;
//    
//    CGFloat w = scrollViewSize.width / newZoomScale;
//    CGFloat h = scrollViewSize.height / newZoomScale;
//    CGFloat x = pointInView.x - (w / 2.0f);
//    CGFloat y = pointInView.y - (h / 2.0f);
//    
//    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
//    
//    // 4
//    [self.scrollView zoomToRect:rectToZoomTo animated:YES];
//}
//
//
//
//- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer {
//    // Zoom out slightly, capping at the minimum zoom scale specified by the scroll view
//    CGFloat newZoomScale = self.scrollView.zoomScale / 1.5f;
//    newZoomScale = MAX(newZoomScale, self.scrollView.minimumZoomScale);
//    [self.scrollView setZoomScale:newZoomScale animated:YES];
//}
//
//
//- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//    // Return the view that you want to zoom
//    return self.imageView;
//}
//
//
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
//    // The scroll view has zoomed, so you need to re-center the contents
//    [self centerScrollViewContents];
//}
//
//
//@end
