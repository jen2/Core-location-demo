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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];

}

- (IBAction)getLocationButtonTapped:(UIButton *)sender
{
    
}


@end
