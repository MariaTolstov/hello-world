//
//  ViewController.m
//  hello-world
//
//  Created by Maria on 4/26/13.
//  Copyright (c) 2013 Maria&Shiran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(userLocation.coordinate, (CLLocationDistance)800, (CLLocationDistance)800)];
    [self.mapView setRegion:region animated:YES];
}

@end
