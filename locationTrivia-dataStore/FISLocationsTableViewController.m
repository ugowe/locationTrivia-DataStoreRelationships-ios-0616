//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Ugowe on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISTriviaTableViewController.h"
#import "FISLocationsDataStore.h"
#import "FISLocation.h"

@interface FISLocationsTableViewController ()
@property (strong, nonatomic) FISLocationsDataStore *store;

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.store = [FISLocationsDataStore sharedLocationsDataStore];

    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
    

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];

    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.store.locations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    FISLocation *location = self.store.locations[indexPath.row];
    cell.textLabel.text = location.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", location.trivia.count];
    
    
    return cell;
}




// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (![segue.identifier isEqualToString:@"addLocation"]) {
    FISTriviaTableViewController *triviaPage = segue.destinationViewController;
    FISLocation *selectedLocation = self.store.locations[self.tableView.indexPathForSelectedRow.row];
    
    
    triviaPage.location = selectedLocation;
    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
