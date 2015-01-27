//
//  UIViewController+SWIShake.m
//  SwipeViewTest
//
//  Created by Evgenyi Tyulenev on 27.01.15.
//  Copyright (c) 2015 e.Tulenev. All rights reserved.
//

#import "UIViewController+SWIShake.h"

@implementation UIViewController (SWIShake)

//Встряхни чтоб выйти)
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
