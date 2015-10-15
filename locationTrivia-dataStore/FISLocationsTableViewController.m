//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Chris Gonzales on 8/20/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISTriviaTableViewController.h"
#import "FISLocationsDataStore.h"
#import "FISLocation.h"

@interface FISLocationsTableViewController ()

@property (strong, nonatomic) FISLocationsDataStore *store;

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.store = [FISLocationsDataStore sharedLocationsDataStore];

    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.store.locations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightDetail" forIndexPath:indexPath];
    FISLocation *currentLocation = self.store.locations[indexPath.row];
    cell.textLabel.text = currentLocation.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", currentLocation.trivia.count];

    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    if (![segue.identifier isEqualToString:@"addLocation"]) {
        
        NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
        FISLocation *location = self.store.locations[ip.row];
        
        FISTriviaTableViewController *triviaTVC = segue.destinationViewController;
        
        triviaTVC.location = location;
    }
}

@end
