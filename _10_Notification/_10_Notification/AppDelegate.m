//
//  AppDelegate.m
//  _10_Notification
//
//  Created by Exo-terminal on 3/14/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "AppDelegate.h"
#import "GRGovernment.h"
#import "GRDoctor.h"
#import "GRBusinessman.h"
#import "GRPensioner.h"
#import "FakeAppDelegate.h"

@interface AppDelegate()
@property (strong, nonatomic) FakeAppDelegate* fakeAppDelegate;
@property (strong, nonatomic) GRGovernment* goverment;
@property (strong, nonatomic) GRBusinessman* businessman;
@property (strong, nonatomic) GRDoctor* doctor;
@property (strong, nonatomic) GRPensioner* pensioner;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:GRGovernmentTaxLevelDidChangeNotification
                                               object:nil];
    
    self.FakeAppDelegate = [[FakeAppDelegate alloc]init];
    
    NSLog(@"AppDelegate: UIApplicationDidFinishLaunchingNotification");

//
//    self.goverment = [[GRGovernment alloc]init];
//    
//    self.doctor= [[GRDoctor alloc] init];
//    self.doctor.doctorSalary = self.goverment.doctorSalary;
//    self.doctor.doctorSalary = self.goverment.doctorSalary;
//    self.doctor.doctorSalary = self.goverment.doctorSalary;
//
//    self.businessman = [[GRBusinessman alloc]init];
//    self.businessman.salary = self.goverment.salary;
//    self.businessman.taxLevel = self.goverment.taxLevel;
//    self.businessman.averagePrice = self.goverment.averagePrice;
//    
//    self.pensioner = [[GRPensioner alloc]init];
//    self.pensioner.pension = self.goverment.pension;
//    self.pensioner.taxLevel = self.goverment.taxLevel;
//    self.pensioner.averagePrice = self.goverment.averagePrice;
// 
//    self.goverment.pension = 550;
//    self.goverment.taxLevel = 5.5f;
//    self.goverment.salary = 1100;
//    self.goverment.doctorSalary = 1000;
//    self.goverment.averagePrice = 15;
////    
//    self.goverment.taxLevel = 16.5f;
//    self.goverment.salary = 1000;
//    self.goverment.doctorSalary = 1200;
//    self.goverment.pension = 550;
//    self.goverment.averagePrice = 17;
//    
//    self.goverment.taxLevel = 3.0f;
//    self.goverment.salary = 950;
//    self.goverment.pension = 460;
//    self.goverment.averagePrice = 10;
//    
//    self.goverment.taxLevel = 15.0f;
//    self.goverment.salary = 930;
//    self.goverment.doctorSalary = 949;
//    self.goverment.pension = 500;
//    self.goverment.averagePrice = 18;
    
    return YES;
}

-(void)governmentNotification:(NSNotification*) notification{
    //    NSLog(@"governmentNotification user Info = %@", notification.userInfo);
    
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"AppDelegate: It is UIApplicationWillResignActiveNotification");

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"AppDelegate: It is UIApplicationDidEnterBackgroundNotification");

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"AppDelegate: It is UIApplicationWillEnterForegroundNotification");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"AppDelegate: It is UIApplicationDidBecomeActiveNotification");

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"AppDelegate: It is UIApplicationWillTerminateNotification");
}

@end
