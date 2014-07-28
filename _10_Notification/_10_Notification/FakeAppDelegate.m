//
//  FakeAppDelegate.m
//  _10_Notification
//
//  Created by Exo-terminal on 3/16/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "FakeAppDelegate.h"

@implementation FakeAppDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(didFinishLaunchingWithOptions:)
                                                    name:UIApplicationDidFinishLaunchingNotification
                                                  object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillResignActive:)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(applicationDidEnterBackground:)
                                                    name:UIApplicationDidEnterBackgroundNotification
                                                  object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(applicationWillEnterForeground:)
                                                    name:UIApplicationWillEnterForegroundNotification
                                                  object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(applicationDidBecomeActive:)
                                                    name:UIApplicationDidBecomeActiveNotification
                                                  object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(applicationWillTerminate:)
                                                    name:UIApplicationWillTerminateNotification
                                                  object:nil];
    }
    return self;
}
-(void) dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)didFinishLaunchingWithOptions:(NSNotificationCenter*)notification{
    NSLog(@"Fake appDelegate: It is UIApplicationDidFinishLaunchingNotification");
    NSLog(@" ");
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"Fake appDelegate: It is UIApplicationWillResignActiveNotification");
    NSLog(@" ");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
     NSLog(@"Fake appDelegate: It is UIApplicationDidEnterBackgroundNotification");
    NSLog(@" ");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"Fake appDelegate: It is UIApplicationWillEnterForegroundNotification");
    NSLog(@" ");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"Fake appDelegate: It is UIApplicationDidBecomeActiveNotification");
    NSLog(@" ");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"Fake appDelegate: It is UIApplicationWillTerminateNotification");
    NSLog(@" ");
}

@end
