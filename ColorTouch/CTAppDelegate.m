//
//  CTAppDelegate.m
//  ColorTouch
//
//  Created by Eric Miller on 10/4/13.
//  Copyright (c) 2013 Frozen Panda. All rights reserved.
//

#import "CTAppDelegate.h"
#import "CTMainViewController.h"

@implementation CTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.mainController = [CTMainViewController new];
    [self.window setRootViewController:self.mainController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
