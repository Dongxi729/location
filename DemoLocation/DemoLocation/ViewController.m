//
//  ViewController.m
//  DemoLocation
//
//  Created by 郑东喜 on 16/5/9.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if ([CLLocationManager locationServicesEnabled]) {
        self.myLocationManager = [[CLLocationManager alloc] init];
        [self.myLocationManager setDelegate:self];
        self.myLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.myLocationManager.distanceFilter = 1.0;
        //        [self.myLocationManager requestAlwaysAuthorization];
        [self.myLocationManager requestWhenInUseAuthorization];
        [self.myLocationManager startUpdatingLocation];
    }else {
        NSLog(@"Location services are not enabled");
    }
}

#pragma mark -
#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"locations is %@",locations);
    CLLocation *location = [locations lastObject];
    self.myGeocoder = [[CLGeocoder alloc] init];
    [self.myGeocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if(error == nil && [placemarks count]>0)
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             
             NSLog(@"name = %@",placemark.name);
             NSLog(@"Country = %@", placemark.country);
             NSLog(@"Postal Code = %@", placemark.postalCode);
             NSLog(@"locality = %@", placemark.locality);
             NSLog(@"subLocality = %@", placemark.subLocality);
             NSLog(@"address = %@",placemark.name);
             NSLog(@"administrativeArea = %@",placemark.administrativeArea);
             NSLog(@"subAdministrativeArea = %@",placemark.subAdministrativeArea);
             NSLog(@"ISOcountryCode = %@",placemark.ISOcountryCode);
             NSLog(@"thoroughfare = %@", placemark.thoroughfare);
             NSLog(@"subThoroughfare = %@",placemark.subThoroughfare);
             
             [_msgLabel setText:[NSString stringWithFormat:@"address is: %@",placemark.locality]];
         }
         else if(error==nil && [placemarks count]==0){
             NSLog(@"No results were returned.");
         }
         else if(error != nil) {
             NSLog(@"An error occurred = %@", error);
         }
     }];
    [self.myLocationManager stopUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"reverse geocoder error: %@", [error description]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
