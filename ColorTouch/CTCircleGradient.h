//
//  CTCircleGradient.h
//  ColorTouch
//
//  Created by Eric Miller on 10/4/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTCircleGradient : UIView

- (id)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

- (void)fadeInWithDuration:(CFTimeInterval)duration;
- (void)fadeOutWithDuration:(CFTimeInterval)duration;

@end
