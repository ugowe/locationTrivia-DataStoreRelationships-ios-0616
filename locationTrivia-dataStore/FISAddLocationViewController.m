//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Chris Gonzales on 8/21/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"
#import <CoreLocation/CoreLocation.h>


@interface FISAddLocationViewController () <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;

@property (weak, nonatomic) IBOutlet UIButton *useCurrentLocationButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAccessibilityLabels];
    [self setupLocationManager];
}

-(void) setupAccessibilityLabels
{
    self.nameField.accessibilityLabel = @"nameField";
    self.nameField.accessibilityIdentifier = @"nameField";
    
    self.latitudeField.accessibilityLabel = @"latitudeField";
    self.latitudeField.accessibilityIdentifier = @"latitudeField";
    
    self.longitudeField.accessibilityLabel = @"longitudeField";
    self.longitudeField.accessibilityIdentifier = @"longitudeField";
    
    self.submitButton.accessibilityLabel = @"saveButton";
    self.submitButton.accessibilityIdentifier = @"saveButton";
    
    self.cancelButton.accessibilityLabel = @"cancelButton";
    self.cancelButton.accessibilityIdentifier = @"cancelButton";
}

- (void)setupLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 50;
    [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManager

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = [locations lastObject];
}

#pragma mark - IBActions

- (IBAction)useCurrentLocation:(id)sender
{
    self.latitudeField.text = [NSString stringWithFormat:@"%f", self.currentLocation.coordinate.latitude];
    self.longitudeField.text = [NSString stringWithFormat:@"%f", self.currentLocation.coordinate.longitude];
}

- (IBAction)submitButtonTapped:(id)sender {
    CGFloat latitude = [self.latitudeField.text doubleValue];
    CGFloat longitude = [self.longitudeField.text doubleValue];
    
    FISLocation *newLocation = [[FISLocation alloc] initWithName:self.nameField.text latitude:latitude longitude:longitude];
    
    [[FISLocationsDataStore sharedLocationsDataStore].locations addObject:newLocation];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
