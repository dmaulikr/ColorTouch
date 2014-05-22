//
//  CTCircleGradient.m
//  ColorTouch
//
//  Created by Eric Miller on 10/4/13.
//  Copyright (c) 2013 Frozen Panda. All rights reserved.
//

#import "CTCircleGradient.h"
#import <QuartzCore/QuartzCore.h>

@implementation CTCircleGradient

- (id)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    self = [super initWithFrame:[self initFrame]];
    if (self) {
        
        self.layer.contents = (__bridge id)([[self generateRadialWithRed:red
                                                                   green:green
                                                                    blue:blue] CGImage]);
    }
    return self;
}

- (UIImage *)generateRadialWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    CGGradientRef gradient;
    CGColorSpaceRef colorSpace;
    size_t numberOfLocations = 6;
    
    CGFloat locations[6] = {0.0, 0.2, 0.4, 0.6, 0.8, 1.0};
    
    CGFloat components[24] = {0.0, 0.0, 0.0, 1.0,
                              red, green, blue, 1.0,
                              red, green, blue, 0.8,
                              red, green, blue, 0.6,
                              red, green, blue, 0.2,
                              red, green, blue, 0.0};
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    gradient = CGGradientCreateWithColorComponents(colorSpace,
                                                   components,
                                                   locations,
                                                   numberOfLocations);
    
    CGPoint startPoint;
    CGPoint endPoint;
    
    startPoint.x = self.frame.size.width/2;
    startPoint.y = self.frame.size.height/2;
    
    endPoint.x = self.frame.size.width/2;
    endPoint.y = self.frame.size.height/2;
    
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef imageContext = UIGraphicsGetCurrentContext();
    CGContextDrawRadialGradient(imageContext,
                                gradient,
                                startPoint,
                                0,
                                endPoint,
                                self.frame.size.width/2,
                                0);
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}


#pragma mark - Animatations

- (void)fadeInWithDuration:(CFTimeInterval)duration {
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeIn setFromValue:@0];
    [fadeIn setToValue:@1];
    [fadeIn setDuration:duration];
    
    [self.layer addAnimation:fadeIn forKey:@"fade"];
}

- (void)fadeOutWithDuration:(NSTimeInterval)duration {
    CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeOut setDelegate:self];
    [fadeOut setFromValue:@1];
    [fadeOut setToValue:@0];
    [fadeOut setDuration:duration];
    
    [fadeOut setFillMode:kCAFillModeForwards];
    [fadeOut setRemovedOnCompletion:NO];
    
    [self.layer addAnimation:fadeOut forKey:@"fade"];
}


#pragma mark - Helpers

- (CGRect)initFrame {
    return CGRectMake(0.f, 0.f, 60.f, 60.f);
}

@end
