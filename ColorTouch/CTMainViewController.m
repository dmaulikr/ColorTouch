//
//  CTMainViewController.m
//  ColorTouch
//
//  Created by Eric Miller on 10/4/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CTMainViewController.h"
#import "CTCircleGradient.h"

@interface CTMainViewController ()

@end

@implementation CTMainViewController

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [view setBackgroundColor:[UIColor darkGrayColor]];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.circleGradient = [[CTCircleGradient alloc]
                           initWithFrame:CGRectMake(50.f, 50.f, 60.f, 60.f)];
    [self.circleGradient fadeOutWithDuration:0];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(screenPan:)];
    
    [self.view addGestureRecognizer:panGesture];
}

#pragma mark - Gestures
- (void)screenPan:(UIPanGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:self.view];
    
    if (gesture.state == UIGestureRecognizerStateChanged) {
        self.circleGradient.center = point;
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.circleGradient fadeOutWithDuration:0.2];
    }
}

#pragma mark - Touch Overrides
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.circleGradient.superview == nil) {
        [self.view addSubview:self.circleGradient];
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    self.circleGradient.center = point;
    
    [self.circleGradient fadeInWithDuration:0.3];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.circleGradient fadeOutWithDuration:0.2];
}

@end
