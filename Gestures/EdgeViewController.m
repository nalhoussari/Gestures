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
@property (nonatomic) CGRect originalPosition;

@end

@implementation EdgeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    int width = [[UIScreen mainScreen] bounds].size.width;
    self.originalPosition = CGRectMake(width - 20, 200, 250, 250);
    self.screenView = [[UIView alloc] initWithFrame:self.originalPosition];
    self.screenView.translatesAutoresizingMaskIntoConstraints = NO;
    self.screenView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.screenView];
    self.screenView.userInteractionEnabled = YES;
 
    UIScreenEdgePanGestureRecognizer *edgeGestrure = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(viewScreenEdge:)];
    [self.screenView addGestureRecognizer: edgeGestrure];
//    [edgeGestrure setEdges:UIRectEdgeRight];
    [edgeGestrure setDelegate:self];
    
    UIPanGestureRecognizer *panGestrure = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewScreenEdge:)];
    [self.screenView addGestureRecognizer: panGestrure];
    [panGestrure setDelegate:self];
    
}


- (void)viewScreenEdge: (UIScreenEdgePanGestureRecognizer *)sender {

    //setting the openedFrame
    CGRect openedFrame = sender.view.frame;
    openedFrame.origin.x =  200;

    if(UIGestureRecognizerStateBegan == sender.state || UIGestureRecognizerStateChanged == sender.state) {
        
        CGPoint translation = [sender translationInView:sender.view];
        
        CGRect theFrame = sender.view.frame;
        theFrame.origin.x = theFrame.origin.x + translation.x;

//        NSLog(@"%f", theFrame.origin.x);
        
        if (theFrame.origin.x > 100 && theFrame.origin.x < 200) {
            theFrame.origin.x = 200;
            [UIView animateWithDuration:0.3f animations:^{
                [sender.view setFrame:theFrame];
            }];
        } else if(theFrame.origin.x > 200) {
            [sender.view setFrame:self.originalPosition];
        }
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // You can customize the way in which gestures can work
    // Enabling multiple gestures will allow all of them to work together, otherwise only the topmost view's gestures will work (i.e. PanGesture view on bottom)
    return YES;
}


@end
