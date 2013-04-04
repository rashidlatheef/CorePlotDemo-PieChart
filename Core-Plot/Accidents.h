//
//  Accidents.h
//  Core-Plot
//
//  Created by Muhammed Rashid A on 28/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Accidents : NSObject



+ (Accidents *)sharedInstance;

- (NSArray *)typesOfVehicles;

- (NSArray *) accidentsAtTrivandrumCity;

- (NSArray *) cities;

- (NSArray *)accidentsDataForVehicle:(NSString *)vehicle;

- (NSArray *)busAccidentsReport;

- (NSArray *)fourWheelerAccidentsReport;

- (NSArray *)twoWheelerAccidentsReport;

- (NSArray *)otherVehicleAccidentsReport;


@end
