//
//  FISAddTriviaViewController.m
//  locationTrivia-dataStore
//
//  Created by Mykel Pereira on 3/17/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaViewController.h"
#import "FISTrivia.h"
#import "FISLocation.h"

@interface FISAddTriviaViewController ()
@property (weak, nonatomic) IBOutlet UITextField *triviaTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation FISAddTriviaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(UIButton *)sender
{
    FISTrivia *trivia = [[FISTrivia alloc] initWithContent:self.triviaTextField.text Likes:0];
    [self.location.trivia addObject:trivia];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
