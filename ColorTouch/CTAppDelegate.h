//
//  CTAppDelegate.h
//  ColorTouch
//
//  Created by Eric Miller on 10/4/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTMainViewController;

@interface CTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) CTMainViewController *mainController;

@end
