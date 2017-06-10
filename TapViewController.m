//
//  TapViewController.m
//  Gestures
//
//  Created by Noor Alhoussari on 2017-06-08.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@property (nonatomic) UIView *squareView;

@end

@implementation TapViewController


- (void)viewDidLoad{
    [super viewDidLoad];
        
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    self.squareView = [[UIView alloc]initWithFrame:frame];
    self.squareView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.squareView];
        
    UITapGestureRecognizer *tapGestrue = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.squareView addGestureRecognizer: tapGestrue];
}

- (void)viewTapped: (UITapGestureRecognizer *)sender {
    
    UIColor *color = [self.squareView.backgroundColor isEqual: [UIColor purpleColor]] ? [UIColor blueColor] : [UIColor purpleColor];
    
    self.squareView.backgroundColor = color;
    
                      //ternary expression is similar to:
//    if(self.squareView.backgroundColor == [UIColor purpleColor]){
//        self.squareView.backgroundColor = ;
//
//    } else {
//        self.squareView.backgroundColor = [UIColor purpleColor];
//    }
}




@end
