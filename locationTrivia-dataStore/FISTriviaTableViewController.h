//
//  FISTriviaTableViewController.h
//  locationTrivia-tableviews
//
//  Created by Chris Gonzales on 8/20/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISTrivium.h"

@class FISLocation;

@interface FISTriviaTableViewController : UITableViewController

@property (strong, nonatomic) FISLocation *location;

@property (strong, nonatomic) NSArray *trivia;


@end
