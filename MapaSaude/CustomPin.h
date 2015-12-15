//
//  CustomPin.h
//  MapaSaude
//
//  Copyright © 2015 Douglas Queiroz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CustomPin : NSObject<MKAnnotation>
@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(copy, nonatomic) NSString *title;
@property(nonatomic) BOOL noSymptom;
@property(nonatomic, strong) NSDictionary *survey;

-(id) initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D) location;
-(MKAnnotationView *) annotationView;

@end
