//
//  SwipeViewController.m
//  Gestures
//
//  Created by Noor Alhoussari on 2017-06-08.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic, weak) UIView *brownView;
@property (nonatomic, strong) UIView *whiteView;

@property (nonatomic, weak) NSLayoutConstraint *whiteViewXConstraint;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *brownView = [[UIView alloc] initWithFrame:CGRectZero];
    brownView.translatesAutoresizingMaskIntoConstraints = NO;
    brownView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:brownView];
    self.brownView.userInteractionEnabled = YES;

    
    NSLayoutConstraint *brownViewHeightConstraint = [NSLayoutConstraint constraintWithItem:brownView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    
    NSLayoutConstraint *brownViewRightConstraint = [NSLayoutConstraint constraintWithItem:brownView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10];
    
    NSLayoutConstraint *brownViewLeftConstraint = [NSLayoutConstraint constraintWithItem:brownView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:300];
    
    NSLayoutConstraint *brownViewYConstraint = [NSLayoutConstraint constraintWithItem:brownView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    [NSLayoutConstraint activateConstraints:@[brownViewHeightConstraint, brownViewRightConstraint, brownViewLeftConstraint, brownViewYConstraint]];
    
    //White view
    self.whiteView = [[UIView alloc] initWithFrame:CGRectZero];
    self.whiteView.translatesAutoresizingMaskIntoConstraints = NO;
    self.whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.whiteView];
    self.whiteView.userInteractionEnabled = YES;
    
    NSLayoutConstraint *whiteViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.whiteView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    
    NSLayoutConstraint *whiteViewWidthConstraint = [NSLayoutConstraint constraintWithItem:self.whiteView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:400];
    
    self.whiteViewXConstraint = [NSLayoutConstraint constraintWithItem:self.whiteView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *whiteViewYConstraint = [NSLayoutConstraint constraintWithItem:self.whiteView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    [NSLayoutConstraint activateConstraints:@[whiteViewHeightConstraint, whiteViewWidthConstraint, self.whiteViewXConstraint, whiteViewYConstraint]];
    
    //swipeGESTURE
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
        [swipeLeft setDirection: UISwipeGestureRecognizerDirectionLeft];
        [self.whiteView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
        [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
        [self.whiteView addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeGestrue = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
        [self.whiteView addGestureRecognizer: swipeGestrue];
}

- (void)viewSwiped: (UISwipeGestureRecognizer *)sender {
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft){

        [UIView animateWithDuration:0.1f animations:^{
            self.whiteViewXConstraint.constant = -105;
        }];
    } else if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Swiped to right");
        [UIView animateWithDuration:1.0f animations:^{
            self.whiteViewXConstraint.constant = 0;
        }];

    }
}

@end
