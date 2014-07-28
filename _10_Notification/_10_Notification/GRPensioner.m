//
//  GRPensioner.m
//  _10_Notification
//
//  Created by Exo-terminal on 3/14/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRPensioner.h"
#import "GRGovernment.h"

@implementation GRPensioner

#pragma mark - initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(pensionChangeNotification:)
                   name:GRGovernmentPensionDidChangeNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(averagePriceChangeNotification:)
                   name:GRGovernmentAveragePriceDidChangeNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(taxLevelChangeNotification:)
                   name:GRGovernmentTaxLevelDidChangeNotification
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

-(void)pensionChangeNotification:(NSNotification*)notification{
 
    NSNumber* value = [notification.userInfo objectForKey:GRGovernmentPensionUserInfoKey];
    CGFloat pension = [value floatValue];
    CGFloat pensionChange = ((pension/(self.pension/100))-100);
    
    if (pensionChange == 0) {
        NSLog(@"Pensioner:   Пенсия стабильна.Стабильность радует.");
    }else if(pensionChange<0){
         pensionChange = (-1*pensionChange);
        NSLog(@"Pensioner:   Понижение пенсии на %.2f%%.А щаз мы вам устроим смену власти!", pensionChange);
    }else{
         NSLog(@"Pensioner:   Повышение пенсит на %.2f%%.Мы живем в самой лучшей стране!", pensionChange);
    }
    self.pension = pension;
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
        NSLog(@"Pensioner:   Средняя цена на товар стала больше на %.2f.Это отвратительно",(averagePrice - self.averagePrice));
    }else{
        NSLog(@"Pensioner:   Средняя цена на товар стала меньше на %.2f.Это замечательно",(self.averagePrice - averagePrice));
    }
    
    CGFloat purchasingPower = ((self.pension*self.taxLevel)/100/averagePrice);
    if (purchasingPower>self.purchasingPower) {
        NSLog(@"Pensioner:   Общий уровень жизни повышен!");
    }else{
        NSLog(@"Pensioner:   Общий уровень жизни понижен!");
    }
    self.purchasingPower = purchasingPower;
    self.averagePrice = averagePrice;
    NSLog(@" ");

    }

@end
