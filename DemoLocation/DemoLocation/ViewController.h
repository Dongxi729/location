//
//  ViewController.h
//  DemoLocation
//
//  Created by 郑东喜 on 16/5/9.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *msgLabel;

@property(strong,nonatomic) CLLocationManager *myLocationManager;
@property(strong,nonatomic) CLGeocoder *myGeocoder;
@property(strong,nonatomic) CLLocation *myLocation;



@end

