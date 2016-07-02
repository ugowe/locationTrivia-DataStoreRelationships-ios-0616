//
//  FISTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Ugowe on 7/2/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"
#import "FISAddTriviaViewController.h"
#import "FISTrivium.h"


@interface FISTriviaTableViewController ()

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.tableView.accessibilityIdentifier = @"Trivia Table";
    self.tableView.accessibilityLabel = @"Trivia Table";
    
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated {
//    [self viewWillAppear:NO];
//    
//    [self.tableView reloadData];
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.location.trivia.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"triviaCell" forIndexPath:indexPath];
    FISTrivium *triviaContent = self.location.trivia[indexPath.row];
    
    cell.textLabel.text = triviaContent.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", triviaContent.likes];
    
    return cell;
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addTrivia"]) {
        FISAddTriviaViewController *addTriviaVC = segue.destinationViewController;
        
        addTriviaVC.location = self.location;
    }
    
}


@end
