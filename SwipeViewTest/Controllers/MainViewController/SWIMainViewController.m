//
//  SWIMainViewController.m
//  SwipeViewTest
//
//  Created by Evgenyi Tyulenev on 27.01.15.
//  Copyright (c) 2015 e.Tulenev. All rights reserved.
//

#import "SWIMainViewController.h"

@implementation SWIMainViewController

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end
