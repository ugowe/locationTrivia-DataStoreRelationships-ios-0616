//
//  FISTriviaTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Chris Gonzales on 8/20/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"
#import "FISAddTriviaViewController.h"
#import "FISTrivium.h"
#import "FISLocation.h"


@interface FISTriviaTableViewController ()

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.tableView.accessibilityIdentifier = @"Trivia Table";
    self.tableView.accessibilityLabel = @"Trivia Table";
    
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
}

- (void)viewWillAppear:(BOOL)animated {
    [self viewWillAppear:animated];

    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.location.trivia count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TriviaCell" forIndexPath:indexPath];
    FISTrivium *currentTrivia = self.location.trivia[indexPath.row];
    cell.textLabel.text = currentTrivia.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", currentTrivia.likes];

    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addTrivia"]) {
        FISAddTriviaViewController *addTriviaVC = segue.destinationViewController;
        
        addTriviaVC.location = self.location;
    }
}

@end
