//
//  CTMainViewController.m
//  ColorTouch
//
//  Created by Eric Miller on 10/4/13.
//  Copyright (c) 2013 Frozen Panda. All rights reserved.
//

#import "CTMainViewController.h"
#import "CTCircleGradient.h"

@interface CTMainViewController ()

@end

@implementation CTMainViewController

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [view setBackgroundColor:[UIColor darkGrayColor]];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.circleGradient = [[CTCircleGradient alloc]
                           initWithRed:1.f
                           green:0.f
                           blue:0.f];
    [self.circleGradient fadeOutWithDuration:0];
}


#pragma mark - Touch Overrides

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.circleGradient.superview == nil) {
        [self.view addSubview:self.circleGradient];
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    
    self.circleGradient.center = touchPoint;
    
    [self.circleGradient fadeInWithDuration:0.2];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    self.circleGradient.center = touchPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.circleGradient fadeOutWithDuration:0.2];
}

@end
