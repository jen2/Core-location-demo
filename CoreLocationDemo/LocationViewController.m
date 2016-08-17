//
//  LocationViewController.m
//  CoreLocationDemo
//
//  Created by Jennifer A Sipila on 6/19/16.
//  Copyright © 2016 Jennifer A Sipila. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation LocationViewController

- (IBAction)getLocationButtonTapped:(UIButton *)sender
{
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
       
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 500;
        
        [self.locationManager startUpdatingLocation];
        
    } else {
        UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Location services are not enabled" message:[NSString stringWithFormat:@"Enable location services and try again"] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [errorAlert addAction:okAction];
        [self presentViewController:errorAlert animated:YES completion:nil];
        NSLog(@"Location services are not enabled");
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.longitude];

    [self.locationManager stopUpdatingLocation];
    self.locationManager = nil;
}

@end
