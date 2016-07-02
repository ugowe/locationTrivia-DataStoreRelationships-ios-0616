//
//  FISAddTriviaViewController.m
//  locationTrivia-dataStore
//
//  Created by Ugowe on 7/2/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.triviaTextField.accessibilityLabel = @"Trivium Text Field";
    self.triviaTextField.accessibilityIdentifier = @"Trivium Text Field";
    
    self.saveButton.accessibilityLabel = @"Save Button";
    self.saveButton.accessibilityIdentifier = @"Save Button";
    
    self.cancelButton.accessibilityLabel = @"Cancel Button";
    self.cancelButton.accessibilityIdentifier = @"Cancel Button";
    
}




- (IBAction)saveTapped:(id)sender {
    FISTrivium *trivium = [[FISTrivium alloc] initWithContent:self.triviaTextField.text likes:0];
    [self.location.trivia addObject:trivium];
    
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
