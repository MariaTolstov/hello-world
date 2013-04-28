//
//  GetRoute.h
//  hello-world
//
//  Created by Maria on 4/27/13.
//  Copyright (c) 2013 Maria&Shiran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface GetRoute : UITableViewCell
- (NSArray*)getRoutePointFrom:(MKPointAnnotation *)origin to:(MKPointAnnotation *)destination;
- (NSMutableArray *)decodePolyLine:(NSMutableString *)encodedString;
@end
