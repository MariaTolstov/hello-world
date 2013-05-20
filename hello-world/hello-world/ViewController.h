//
//  ViewController.h
//  hello-world
//
//  Created by Maria on 4/26/13.
//  Copyright (c) 2013 Maria&Shiran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
<<<<<<< HEAD
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
=======
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
//#import "AFHTTPClient.h"
//#import "AFJSONRequestOperation.h"
>>>>>>> new!!

@interface ViewController : UIViewController <MKMapViewDelegate>
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
- (void)drawRoute:(NSArray *)routePoints;
- (NSArray*)getRoutePointFrom:(MKPointAnnotation *)origin to:(MKPointAnnotation *)destination;
- (void)parseResponse:(NSDictionary *)response;
-(NSMutableArray *)decodePolyLine:(NSMutableString *)encodedString;
- (MKOverlayView*)mapView:(MKMapView*)theMapView viewForOverlay:(id <MKOverlay>)overlay;


//- (void)centerMap;
- (void)drawRoute:(NSArray *)routePoints;
- (NSArray*)getRoutePointFrom:(MKPointAnnotation *)origin to:(MKPointAnnotation *)destination;
- (void)parseResponse:(NSDictionary *)response;
-(NSMutableArray *)decodePolyLine:(NSMutableString *)encodedString;
- (MKOverlayView*)mapView:(MKMapView*)theMapView viewForOverlay:(id <MKOverlay>)overlay;
@end


