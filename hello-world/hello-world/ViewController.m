//
//  ViewController.m
//  hello-world!!!!!!!!!!!!!
//
//  Created by Maria on 4/26/13.
//  Copyright (c) 2013 Maria&Shiran. All rights reserved.
//

#import "ViewController.h"
#import <foundation/foundation.h>

@interface ViewController ()
@end
@implementation ViewController
@synthesize mapView;

<<<<<<< HEAD
NSMutableArray *pathPoints;
=======


bool recordMode = FALSE;
MKPointAnnotation *startPoint = nil;
+ (void)startInitialize {
    if(!startPoint)
        startPoint = [[MKPointAnnotation alloc] init];
}
NSMutableArray *locationArray = nil;
id object;
+ (void)initialize {
    if(!locationArray)
        locationArray = [[NSMutableArray alloc] init];
}

>>>>>>> test

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.delegate = self;
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPressGestureRecognizer.minimumPressDuration = 1.0; //user needs to press for 2 seconds
    [self.mapView addGestureRecognizer:longPressGestureRecognizer];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
<<<<<<< HEAD
    
    [self.mapView addAnnotation:point];
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = touchMapCoordinate;
    [self.mapView addAnnotation:annotation];

    if(pathPoints == nil){
        pathPoints = [[NSMutableArray alloc] initWithCapacity:2];
        [pathPoints addObject:annotation];
    } else {
        if(pathPoints != nil && [pathPoints count] == 1){
            MKPointAnnotation *prevPoint = [pathPoints objectAtIndex:0];
            NSArray *arrRoutePoints = [self getRoutePointFrom: prevPoint to:annotation];
            [self drawRoute:arrRoutePoints];
        } else {
            MKPointAnnotation *prevPoint = [pathPoints lastObject];
            NSArray *arrRoutePoints = [self getRoutePointFrom: prevPoint to:annotation];
            [self drawRoute:arrRoutePoints];
        }
        [pathPoints addObject:annotation];
    }
}

- (void)drawRoute:(NSArray *)routePoints
{
    int numPoints = [routePoints count];
    if (numPoints > 1)
    {
        CLLocationCoordinate2D* coords = malloc(numPoints * sizeof(CLLocationCoordinate2D));
        for (int i = 0; i < numPoints; i++)
        {
            CLLocation* current = [routePoints objectAtIndex:i];
            coords[i] = current.coordinate;
        }
        
        MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coords count:numPoints];
        free(coords);
        
        [self.mapView addOverlay:polyline];
        
        //[objMapView setNeedsDisplay];
    }
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
    MKPolylineView *polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
    polylineView.strokeColor = [UIColor lightGrayColor];
    polylineView.lineWidth = 3.0;
    
    return polylineView;
}


- (NSArray*)getRoutePointFrom:(MKPointAnnotation *)origin to:(MKPointAnnotation *)destination
{
    NSString* saddr = [NSString stringWithFormat:@"%f,%f", origin.coordinate.latitude, origin.coordinate.longitude];
    NSString* daddr = [NSString stringWithFormat:@"%f,%f", destination.coordinate.latitude, destination.coordinate.longitude];
    
    NSString* apiUrlStr = [NSString stringWithFormat:@"http://maps.google.com/maps?output=dragdir&saddr=%@&daddr=%@", saddr, daddr];
    NSURL* apiUrl = [NSURL URLWithString:apiUrlStr];
    
    NSError *error;
    NSString *apiResponse = [NSString stringWithContentsOfURL:apiUrl encoding:NSUTF8StringEncoding error:&error];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"points:\\\"([^\\\"]*)\\\"" options:0 error:NULL];
    NSTextCheckingResult *match = [regex firstMatchInString:apiResponse options:0 range:NSMakeRange(0, [apiResponse length])];
    NSString *encodedPoints = [apiResponse substringWithRange:[match rangeAtIndex:1]];
    
    return [self decodePolyLine:[encodedPoints mutableCopy]];
}

- (NSMutableArray *)decodePolyLine:(NSMutableString *)encodedString
{
    [encodedString replaceOccurrencesOfString:@"\\\\" withString:@"\\"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [encodedString length])];
    NSInteger len = [encodedString length];
    NSInteger index = 0;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSInteger lat=0;
    NSInteger lng=0;
    while (index < len) {
        NSInteger b;
        NSInteger shift = 0;
        NSInteger result = 0;
        do {
            b = [encodedString characterAtIndex:index++] - 63;
            result |= (b & 0x1f) << shift;
            shift += 5;
        } while (b >= 0x20);
        NSInteger dlat = ((result & 1) ? ~(result >> 1) : (result >> 1));
        lat += dlat;
        shift = 0;
        result = 0;
        do {
            b = [encodedString characterAtIndex:index++] - 63;
            result |= (b & 0x1f) << shift;
            shift += 5;
        } while (b >= 0x20);
        NSInteger dlng = ((result & 1) ? ~(result >> 1) : (result >> 1));
        lng += dlng;
        NSNumber *latitude = [[NSNumber alloc] initWithFloat:lat * 1e-5];
        NSNumber *longitude = [[NSNumber alloc] initWithFloat:lng * 1e-5];
        printf("\n[%f,", [latitude doubleValue]);
        printf("%f]", [longitude doubleValue]);
        CLLocation *loc = [[CLLocation alloc] initWithLatitude:[latitude floatValue] longitude:[longitude floatValue]];
        [array addObject:loc];
    }
    return array;
}

//- (void)centerMap
//{
//    MKCoordinateRegion region;
//    
//    CLLocationDegrees maxLat = -90;
//    CLLocationDegrees maxLon = -180;
//    CLLocationDegrees minLat = 90;
//    CLLocationDegrees minLon = 180;
//    
//    for(int idx = 0; idx < arrRoutePoints.count; idx++)
//    {
//        CLLocation* currentLocation = [arrRoutePoints objectAtIndex:idx];
//        
//        if(currentLocation.coordinate.latitude > maxLat)
//            maxLat = currentLocation.coordinate.latitude;
//        if(currentLocation.coordinate.latitude < minLat)
//            minLat = currentLocation.coordinate.latitude;
//        if(currentLocation.coordinate.longitude > maxLon)
//            maxLon = currentLocation.coordinate.longitude;
//        if(currentLocation.coordinate.longitude < minLon)
//            minLon = currentLocation.coordinate.longitude;
//    }
//    
//    region.center.latitude     = (maxLat + minLat) / 2;
//    region.center.longitude    = (maxLon + minLon) / 2;
//    region.span.latitudeDelta  = maxLat - minLat;
//    region.span.longitudeDelta = maxLon - minLon;
//    
//    [objMapView setRegion:region animated:YES];
//}
=======
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    if (recordMode == TRUE)
    {
        [locationArray addObject:userLocation];
    }
    //[self.mapView addAnnotation:point];
}



- (IBAction)record:(id)sender {
    if (recordMode == FALSE)
    {
    recordMode = TRUE;
    startPoint.coordinate = mapView.userLocation.coordinate;
    }
    else if (recordMode == TRUE){
        recordMode=FALSE;
        MKPointAnnotation *endPoint = [[MKPointAnnotation alloc] init];
        endPoint.coordinate = mapView.userLocation.coordinate;
        [self.mapView addAnnotation: endPoint];
         [self.mapView addAnnotation: startPoint];
       //  for(id object in locationArray)
        //      [self.mapView addOverlays:object];
        
           //  [self.mapView addAnnotation:object];
        
             }}
>>>>>>> test

@end
