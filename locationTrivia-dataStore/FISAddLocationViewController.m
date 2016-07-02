//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Ugowe on 7/2/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.name.accessibilityLabel = @"nameField";
    self.name.accessibilityIdentifier = @"nameField";
    
    self.latitude.accessibilityLabel = @"latitudeField";
    self.latitude.accessibilityIdentifier = @"latitudeField";
    
    self.longitude.accessibilityLabel = @"longitudeField";
    self.longitude.accessibilityIdentifier = @"longitudeField";
    
    self.saveButton.accessibilityLabel = @"saveButton";
    self.saveButton.accessibilityIdentifier = @"saveButton";
    
    self.cancelButton.accessibilityLabel = @"cancelButton";
    self.cancelButton.accessibilityIdentifier = @"cancelButton";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//}
- (IBAction)saveTapped:(id)sender {
    CGFloat latitude = [self.latitude.text doubleValue];
    CGFloat longitude = [self.longitude.text doubleValue];
    
    FISLocation *newLocation = [[FISLocation alloc] initWithName:self.name.text latitude:latitude longitude:longitude];
    
    [[FISLocationsDataStore sharedLocationsDataStore].locations addObject:newLocation];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
