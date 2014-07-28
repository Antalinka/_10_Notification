//
//  GRGovernment.m
//  _10_NotificationTest
//
//  Created by Exo-terminal on 3/14/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRGovernment.h"

NSString* const GRGovernmentTaxLevelDidChangeNotification = @"GRGovernmentTaxLevelDidChangeNotification";
NSString* const GRGovernmentSalaryDidChangeNotification = @"GRGovernmentSalaryDidChangeNotification";
NSString* const GRGovernmentPensionDidChangeNotification = @"GRGovernmentPensionDidChangeNotification";
NSString* const GRGovernmentAveragePriceDidChangeNotification = @"GRGovernmentAveragePriceDidChangeNotification";
NSString* const GRGovermentDoctorSalaryDidChangeNotification = @"GRGovermentDoctorSalaryDidChangeNotification";

NSString* const GRGovernmentTaxLevelUserInfoKey = @"GRGovernmentTaxLevelUserInfoKey";
NSString* const GRGovernmentSalaryUserInfoKey = @"GRGovernmentSalaryUserInfoKey";
NSString* const GRGovernmentPensionUserInfoKey = @"GRGovernmentPensionUserInfoKey";
NSString* const GRGovernmentAveragePriceUserInfoKey = @"GRGovernmentAveragePriceUserInfoKey";
NSString* const GRGovermentDoctorSalaryUserInfoKey = @"GRGovermentDoctorSalaryUserInfoKey";

@implementation GRGovernment

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taxLevel = 5.f;
        self.salary = 1000;
        self.pension = 500;
        self.averagePrice = 10.f;
        self.doctorSalary = 980.f;
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(didEnterBackgroundNotification:)
                                                    name:UIApplicationDidEnterBackgroundNotification
                                                  object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(willEnterForegroundNotification:)
                                                    name:UIApplicationWillEnterForegroundNotification
                                                  object:nil];
    }
    return self;
}
#pragma mark - Notification

-(void)didEnterBackgroundNotification:(NSNotification*)notification{
    NSLog(@"Government goes to sleep...");
}
-(void)willEnterForegroundNotification:(NSNotification*)notification{
    NSLog(@"Government woke up");
}

#pragma mark - Setters

-(void) setTaxLevel:(CGFloat)taxLevel{
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:GRGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:GRGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

-(void) setSalary:(CGFloat)salary{
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:GRGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:GRGovernmentSalaryDidChangeNotification
                                                       object:nil
                                                     userInfo:dictionary];
}

-(void) setPension:(CGFloat)pension{
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:GRGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:GRGovernmentPensionDidChangeNotification
                                                       object:nil
                                                     userInfo:dictionary];
}

-(void) setAveragePrice:(CGFloat)averagePrice{
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:GRGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:GRGovernmentAveragePriceDidChangeNotification
                                                       object:nil
                                                     userInfo:dictionary];

}

-(void) setDoctorSalary:(CGFloat)doctorSalary{
    _doctorSalary = doctorSalary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:doctorSalary] forKey:GRGovermentDoctorSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:GRGovermentDoctorSalaryDidChangeNotification
                                                       object:nil
                                                     userInfo:dictionary];
}

@end
