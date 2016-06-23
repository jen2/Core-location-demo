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
@property (nonatomic, strong) CLLocation *location;

@end

@implementation LocationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)getLocationButtonTapped:(UIButton *)sender
{
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.location = [[CLLocation alloc] init];
        
        self.locationManager.delegate = self;
        
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
       
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 500;
        
        [self.locationManager startUpdatingLocation];
        
    } else {
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
