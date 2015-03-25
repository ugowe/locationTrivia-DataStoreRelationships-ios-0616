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
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
- (IBAction)submitButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 50;
    [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [self.locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSNumber *latitude = [NSNumber numberWithInteger:[self.latitudeField.text integerValue]];
    NSNumber *longitude = [NSNumber numberWithInteger:[self.longitudeField.text integerValue]];
    FISLocation *newLocation = [[FISLocation alloc] initWithName:self.nameField.text Latitude:latitude Longitude:longitude];
    [[FISLocationsDataStore sharedLocationsDataStore].locations addObject:newLocation];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
