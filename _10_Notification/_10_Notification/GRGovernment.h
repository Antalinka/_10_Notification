//
//  GRGovernment.h
//  _10_NotificationTest
//
//  Created by Exo-terminal on 3/14/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const GRGovernmentTaxLevelDidChangeNotification;
extern NSString* const GRGovernmentSalaryDidChangeNotification;
extern NSString* const GRGovernmentPensionDidChangeNotification;
extern NSString* const GRGovernmentAveragePriceDidChangeNotification;
extern NSString* const GRGovermentDoctorSalaryDidChangeNotification;

extern NSString* const GRGovernmentTaxLevelUserInfoKey;
extern NSString* const GRGovernmentSalaryUserInfoKey;
extern NSString* const GRGovernmentPensionUserInfoKey;
extern NSString* const GRGovernmentAveragePriceUserInfoKey;
extern NSString* const GRGovermentDoctorSalaryUserInfoKey;

@interface GRGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat doctorSalary;

@end
