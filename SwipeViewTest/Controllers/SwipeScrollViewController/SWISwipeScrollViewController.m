//
//  SWISwipeScrollViewController.m
//  SwipeViewTest
//
//  Created by Evgenyi Tyulenev on 27.01.15.
//  Copyright (c) 2015 e.Tulenev. All rights reserved.
//

#import "SWISwipeScrollViewController.h"
#import "UIViewController+SWIShake.h"

@interface SWISwipeScrollViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) NSInteger currentPage;
@end

@implementation SWISwipeScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Rotation handling methods

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         float offset = _currentPage * self.view.frame.size.width;
         [self.scrollView setContentOffset:CGPointMake(offset, 0)];
     } completion:nil];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.view.frame.size.width;
    _currentPage = self.scrollView.contentOffset.x / pageWidth;
}



@end
