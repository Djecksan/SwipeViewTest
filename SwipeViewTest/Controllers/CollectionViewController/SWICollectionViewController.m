//
//  SWICollectionViewController.m
//  SwipeViewTest
//
//  Created by e.Tulenev on 27.01.15.
//  Copyright (c) 2015 e.Tulenev. All rights reserved.
//

#import "SWICollectionViewController.h"
#import "UIViewController+SWIShake.h"

static NSString *SWICell = @"SWICell";

@interface SWICollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic) NSArray *viewColors;
@property (nonatomic) NSIndexPath *currentPathCell;
@end

@implementation SWICollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewColors = @[[UIColor redColor], [UIColor greenColor]];
    [self setupFlowLayout];
}

-(void)setupFlowLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setCollectionViewLayout:flowLayout];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _viewColors.count;
}

#pragma mark - UICollectionViewCellDelegate

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SWICell forIndexPath:indexPath];
    [cell.contentView setBackgroundColor:_viewColors[indexPath.row]];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.frame.size;
}

#pragma mark - Rotation handling methods

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:
(NSTimeInterval)duration {
    [self.collectionView.collectionViewLayout invalidateLayout];
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.collectionView scrollToItemAtIndexPath:_currentPathCell atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.view.frame.size.width;
    CGFloat currentPage = self.collectionView.contentOffset.x / pageWidth;
    _currentPathCell = [NSIndexPath indexPathForRow:currentPage inSection:0];
}

@end