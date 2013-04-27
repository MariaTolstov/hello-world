//
//  ViewController.h
//  hello-world
//
//  Created by Maria on 4/26/13.
//  Copyright (c) 2013 Maria&Shiran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
