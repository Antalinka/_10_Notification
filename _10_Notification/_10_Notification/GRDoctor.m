//
//  GRDoctor.m
//  _10_NotificationTest
//
//  Created by Exo-terminal on 3/14/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRDoctor.h"
#import "GRGovernment.h"

@implementation GRDoctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(taxLevelChangeNotification:)
                   name:GRGovernmentTaxLevelDidChangeNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(averagePriceChangeNotification:)
                   name:GRGovernmentAveragePriceDidChangeNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(doctorSalaryChangeNotification:)
                   name:GRGovermentDoctorSalaryDidChangeNotification
                 object:nil];
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

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)didEnterBackgroundNotification:(NSNotification*)notification{
    NSLog(@"Pensioner goes to sleep...");
}
-(void)willEnterForegroundNotification:(NSNotification*)notification{
    NSLog(@"Pensioner woke up");
}

#pragma mark - notification

-(void)doctorSalaryChangeNotification:(NSNotification*)notification{
    
    NSNumber* value = [notification.userInfo objectForKey:GRGovermentDoctorSalaryUserInfoKey];
    CGFloat doctorSalary = [value floatValue];
    CGFloat changeSalary = ((doctorSalary/(self.doctorSalary/100))-100);

    if (changeSalary == 0) {
        NSLog(@"Doctor:      Зарплата стабильна.Стабильность радует.");
    }else if(changeSalary<0){
        changeSalary = (-1*changeSalary);
        NSLog(@"Doctor:      Понижение зарплаты на %.2f%%.А щаз мы вам устроим смену власти!", changeSalary);
    }else{
        NSLog(@"Doctor:      Повышение зарплаты на %.2f%%.Мы живем в самой лучшей стране!", changeSalary);
    }
    self.doctorSalary = doctorSalary;
}

-(void)taxLevelChangeNotification:(NSNotification*)notification{
    NSNumber* value = [notification.userInfo objectForKey:GRGovernmentTaxLevelUserInfoKey];
    CGFloat taxLevel = [value floatValue];
    self.taxLevel = taxLevel;
}

-(void)averagePriceChangeNotification:(NSNotification*)notification{
    NSNumber* value = [notification.userInfo objectForKey:GRGovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    if (averagePrice>self.averagePrice) {
        NSLog(@"Doctor:      Средняя цена на товар стала больше на %.2f.Это отвратительно",(averagePrice - self.averagePrice));
    }else{
        NSLog(@"Doctor:      Средняя цена на товар стала меньше на %.2f.Это замечательно",(self.averagePrice - averagePrice));
    }
    
    CGFloat purchasingPower = ((self.doctorSalary*self.taxLevel)/100/averagePrice);
    if (purchasingPower>self.purchasingPower) {
        NSLog(@"Doctor:      Общий уровень жизни повышен!");
    }else{
        NSLog(@"Doctor:      Общий уровень жизни понижен!");
    }
    self.purchasingPower = purchasingPower;
    self.averagePrice = averagePrice;
}
@end
