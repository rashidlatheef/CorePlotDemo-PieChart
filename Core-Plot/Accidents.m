//
//  Accidents.m
//  Core-Plot
//
//  Created by Muhammed Rashid A on 28/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Accidents.h"
#define BUS @"BUS"
#define FOUR_WHEELER @"FOUR WHEELER"
#define TWO_WHEELER @"TWO WHEELER"
#define OTHERS @"OTHERS"

@implementation Accidents


+ (Accidents *)sharedInstance
{
    static Accidents *sharedInstance;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];      
    });
    
    return sharedInstance;
}

- (NSArray *)typesOfVehicles
{
    return [NSArray arrayWithObjects:@"Bus", @"Four Wheeler", @"Two Wheeler",@"Others", nil];
}

- (NSArray *) accidentsAtTrivandrumCity
{
    return [NSArray arrayWithObjects:[NSDecimalNumber numberWithFloat:187], [NSDecimalNumber numberWithFloat:598], [NSDecimalNumber numberWithFloat:1557], [NSDecimalNumber numberWithFloat:375],  nil];
}

- (NSArray *) cities
{
    return [NSArray arrayWithObjects:@"TrivandrumCity", @"KollamCity", @"EKM City", @"Trissur City", nil];
}


- (NSArray *)accidentsDataForVehicle:(NSString *)vehicle
{
    if([[vehicle uppercaseString] isEqualToString:BUS]) 
    {
        return [self busAccidentsReport];
    }
    else if([[vehicle uppercaseString] isEqualToString:FOUR_WHEELER]) 
    {
        return [self fourWheelerAccidentsReport];

    }
    else if([[vehicle uppercaseString] isEqualToString:TWO_WHEELER]) 
    {
        return [self twoWheelerAccidentsReport];

    }
    else if([[vehicle uppercaseString] isEqualToString:OTHERS]) 
    {
        return [self otherVehicleAccidentsReport];

    }
    
    return [NSArray array];
}

- (NSArray *)busAccidentsReport
{
    return [NSArray arrayWithObjects:[NSDecimalNumber numberWithFloat:187], [NSDecimalNumber numberWithFloat:161], [NSDecimalNumber numberWithFloat:366], [NSDecimalNumber numberWithFloat:191],  nil];
}

- (NSArray *)fourWheelerAccidentsReport
{
    return [NSArray arrayWithObjects:[NSDecimalNumber numberWithFloat:598], [NSDecimalNumber numberWithFloat:525], [NSDecimalNumber numberWithFloat:788], [NSDecimalNumber numberWithFloat:392],  nil];
}

- (NSArray *)twoWheelerAccidentsReport
{
    return [NSArray arrayWithObjects:[NSDecimalNumber numberWithFloat:1557], [NSDecimalNumber numberWithFloat:1108], [NSDecimalNumber numberWithFloat:1315], [NSDecimalNumber numberWithFloat:741],  nil];
}

- (NSArray *)otherVehicleAccidentsReport
{
    return [NSArray arrayWithObjects:[NSDecimalNumber numberWithFloat:375], [NSDecimalNumber numberWithFloat:371], [NSDecimalNumber numberWithFloat:599], [NSDecimalNumber numberWithFloat:342],  nil];
}

@end