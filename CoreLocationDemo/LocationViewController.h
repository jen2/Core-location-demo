//
//  LocationViewController.h
//  CoreLocationDemo
//
//  Created by Jennifer A Sipila on 6/19/16.
//  Copyright © 2016 Jennifer A Sipila. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;

@end
