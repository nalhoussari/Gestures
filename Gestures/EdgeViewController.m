//
//  EdgeViewController.m
//  Gestures
//
//  Created by Noor Alhoussari on 2017-06-10.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//
//Notes from assignemnt:
//This gesture recognizer is a subclass of UIPanGestureRecognizer. The difference is that UIScreenEdgePanGestureRecognizer only starts receiving pan data if the gesture is started from one of the screen edges that you specify. The gesture has an edges property. The type of this property is UIRectEdge which is a bitwise property. You can use the bitwise or "|" (single pipe) to have the gesture respond to more than one edge. In the exercise you will only add it to one edge.
//

#import "EdgeViewController.h"

@interface EdgeViewController () <UIGestureRecognizerDelegate>

@property (nonatomic) UIView *screenView;
@property (nonatomic) NSLayoutConstraint *screenViewXConstraint;
@property (nonatomic) CGFloat centerX;

@end

@implementation EdgeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.screenView = [[UIView alloc] initWithFrame:CGRectZero];
    self.screenView.translatesAutoresizingMaskIntoConstraints = NO;
    self.screenView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.screenView];
    self.screenView.userInteractionEnabled = YES;
    
    NSLayoutConstraint *screenViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:250];
    
    NSLayoutConstraint *screenViewWidthConstraint = [NSLayoutConstraint constraintWithItem:self.screenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:250];
    
    self.screenViewXConstraint = [NSLayoutConstraint constraintWithItem:self.screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeCenterX multiplier:1.0 constant:300];
    
    NSLayoutConstraint *screenViewYConstraint = [NSLayoutConstraint constraintWithItem:self.screenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    [NSLayoutConstraint activateConstraints:@[screenViewHeightConstraint, screenViewWidthConstraint, self.screenViewXConstraint, screenViewYConstraint]];

    
//    CGFloat width = 100;
//    CGFloat height = 100;
//    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
//    UIView *view = [[UIView alloc]initWithFrame:frame];
//    view.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:view];
 
    UIScreenEdgePanGestureRecognizer *edgeGestrure = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(viewScreenEdge:)];
    [self.view addGestureRecognizer: edgeGestrure];
    [edgeGestrure setEdges:UIRectEdgeRight];
    [edgeGestrure setDelegate:self];
    [self.view addGestureRecognizer: edgeGestrure];
    
    
}

- (IBAction)redViewPan:(UIPanGestureRecognizer *)sender {
    //    CGPoint locationInView = [sender locationInView:self.view];
    //    sender.view.center = locationInView;
    
    CGPoint translationInView = [sender translationInView:self.view];
    
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake (oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    
    sender.view.center = newCenter;
    [sender setTranslation: CGPointZero inView:self.view];
    
}


- (void)viewScreenEdge: (UIScreenEdgePanGestureRecognizer *)sender {

    // Get the current view we are touching
    UIView *view = [self.screenView hitTest:[sender locationInView:sender.view] withEvent:nil];

    self.centerX = self.view.bounds.size.width / 2;

    if(UIGestureRecognizerStateBegan == sender.state || UIGestureRecognizerStateChanged == sender.state) {
//    if(UIGestureRecognizerStateBegan) {
        CGPoint translation = [sender translationInView:sender.view];
        // Move the view's center using the gesture
        [UIView animateWithDuration:0.3f animations:^{
        view.center = CGPointMake(self.centerX+ translation.x, view.center.y);
        }];
    }
//    } else {// cancel, fail, or ended
//        // Animate back to center x
//        [UIView animateWithDuration:0.3f animations:^{
//            view.center = CGPointMake(self.centerX, view.center.y);
//        }];
//    }

    
//    if (sender.edges == UIRectEdgeLeft){
//
//        CGPoint translationInView = [sender translationInView:self.view];
//        
//        CGPoint oldCenter = sender.view.center;
//        CGPoint newCenter = CGPointMake (oldCenter.x + translationInView.x, oldCenter.y);
//        
//        sender.view.center = newCenter;
//        [sender setTranslation: CGPointZero inView:self.view];

//        [UIView animateWithDuration:0.1f animations:^{
//            self.screenViewXConstraint.constant -= 250;
//        }];
////            } else if (sender.edges == UIRectEdgeRight) {
//    } else {
////        NSLog(@"Swiped to right");
//        [UIView animateWithDuration:1.0f animations:^{
//            self.screenViewXConstraint.constant = 0;
//        }];
//    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // You can customize the way in which gestures can work
    // Enabling multiple gestures will allow all of them to work together, otherwise only the topmost view's gestures will work (i.e. PanGesture view on bottom)
    return YES;
}


@end
