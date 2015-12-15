//
//  CustomPin.m
//  MapaSaude
//
//  Copyright © 2015 Douglas Queiroz. All rights reserved.
//

#import "CustomPin.h"

@implementation CustomPin

-(id) initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D) location {
    self = [super init];
    
    _title = newTitle;
    _coordinate = location;
    
    return self;
}

-(MKAnnotationView *) annotationView{
    MKAnnotationView *annotationView =  [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"CustomAnnotation"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    UIButton *btnPin = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = btnPin;
    
    return annotationView;
}

@end
