//
//  FISLocationsDataStore.h
//  locationTrivia-dataStore
//
//  Created by Ugowe on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISLocation.h"
#import "FISTrivium.h"

@interface FISLocationsDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *locations;

+ (instancetype)sharedLocationsDataStore;
- (instancetype)init;
- (void)generateStartingLocationsData;



@end
