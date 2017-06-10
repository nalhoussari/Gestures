//
//  PanViewController.m
//  Gestures
//
//  Created by Noor Alhoussari on 2017-06-08.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (IBAction)redViewPan:(UIPanGestureRecognizer *)sender {
//    CGPoint locationInView = [sender locationInView:self.view];
//    sender.view.center = locationInView;
    
    CGPoint translationInView = [sender translationInView:self.view];
    
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake (oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    
    sender.view.center = newCenter;
    [sender setTranslation: CGPointZero inView:self.view];
    
}


@end
