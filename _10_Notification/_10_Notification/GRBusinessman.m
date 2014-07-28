//
//  GRBusinessman.m
//  _10_Notification
//
//  Created by Exo-terminal on 3/14/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRBusinessman.h"
#import "GRGovernment.h"

@implementation GRBusinessman
#pragma mark - initialization

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
               selector:@selector(salaryChangeNotification:)
                   name:GRGovernmentSalaryDidChangeNotification
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
    NSLog(@"Businessman goes to sleep...");
}
-(void)willEnterForegroundNotification:(NSNotification*)notification{
    NSLog(@"Businessman woke up");
}

#pragma mark - notification

-(void)salaryChangeNotification:(NSNotification*)notification{
    NSNumber* value = [notification.userInfo objectForKey:GRGovernmentSalaryUserInfoKey];
    CGFloat salary = [value floatValue];
    CGFloat changeSalary = ((salary/(self.salary/100))-100);
    
    if (changeSalary == 0) {
        NSLog(@"Businessman: Зарплата стабильна.Стабильность радует.");
    }else if(changeSalary<0){
        changeSalary = (-1*changeSalary);
        NSLog(@"Businessman: Понижение зарплаты на %.2f%%.А щаз мы вам устроим смену власти!", changeSalary);
    }else{
        NSLog(@"Businessman: Повышение зарплаты на %.2f%%.Мы живем в самой лучшей стране!", changeSalary);
    }
    self.salary = salary;
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
        NSLog(@"Businessman: Средняя цена на товар стала больше на %.2f.Это отвратительно",(averagePrice - self.averagePrice));
    }else{
        NSLog(@"Businessman: Средняя цена на товар стала меньше на %.2f.Это замечательно",(self.averagePrice - averagePrice));
    }
    
    CGFloat purchasingPower = ((self.salary*self.taxLevel)/100/averagePrice);
    if (purchasingPower>self.purchasingPower) {
        NSLog(@"Businessman: Общий уровень жизни повышен!");
    }else{
        NSLog(@"Businessman: Общий уровень жизни понижен!");
    }
    self.purchasingPower = purchasingPower;
    self.averagePrice = averagePrice;
}

@end
