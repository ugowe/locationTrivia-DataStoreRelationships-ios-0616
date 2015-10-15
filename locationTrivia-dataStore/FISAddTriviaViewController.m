//
//  FISAddTriviaViewController.m
//  locationTrivia-dataStore
//
//  Created by Mykel Pereira on 3/17/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaViewController.h"
#import "FISTrivium.h"
#import "FISLocation.h"

@interface FISAddTriviaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *triviaTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation FISAddTriviaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)saveButtonTapped:(UIButton *)sender
{
    FISTrivium *trivium = [[FISTrivium alloc] initWithContent:self.triviaTextField.text likes:0];
    [self.location.trivia addObject:trivium];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
