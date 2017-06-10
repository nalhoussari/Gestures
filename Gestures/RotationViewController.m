//
//  RotationViewController.m
//  Gestures
//
//  Created by Noor Alhoussari on 2017-06-08.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad{

    [super viewDidLoad];
        
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
        
    UIRotationGestureRecognizer *rotationGestrue = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(viewRotated:)];
    [view addGestureRecognizer: rotationGestrue];
}
    
- (void)viewRotated: (UIRotationGestureRecognizer *)sender {
    
    if ([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged) {
        
        CGFloat rotate = sender.rotation;
        sender.view.transform = CGAffineTransformRotate(sender.view.transform, rotate);
        
        [sender setRotation:0];
    }
}
@end
