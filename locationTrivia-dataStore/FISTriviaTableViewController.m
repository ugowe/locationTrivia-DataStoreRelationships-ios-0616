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
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.location.trivia count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TriviaCell" forIndexPath:indexPath];
    FISTrivium *currentTrivia = self.location.trivia[indexPath.row];
    cell.textLabel.text = currentTrivia.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", currentTrivia.likes];
    // Configure the cell...
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addTrivia"]) {
        FISAddTriviaViewController *addTriviaVC = segue.destinationViewController;
        
        addTriviaVC.location = self.location;
    }
}

@end
