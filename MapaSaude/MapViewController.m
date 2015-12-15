//
//  ViewController.m
//  MapaSaude
//
//  Copyright © 2015 Douglas Queiroz. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MapViewController.h"
#import "SurveyService.h"
#import "DetailViewController.h"
#import "CustomPin.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapa;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MKCoordinateRegion centroMapa;
    centroMapa.center.longitude = -34.89238114;
    centroMapa.center.latitude = -8.08665009;
    
    MKCoordinateSpan span;
    span.latitudeDelta  = 0.001;
    span.longitudeDelta = 0.001;
    centroMapa.span = span;
    
    [self.mapa setRegion:centroMapa animated:YES];


    for (NSDictionary *survey in [SurveyService getSurveys])
    {
        CLLocationCoordinate2D coordenada = CLLocationCoordinate2DMake([survey[@"lat"] doubleValue], [survey[@"lon"] doubleValue]);
        
        CustomPin *pin = [[CustomPin alloc] initWithTitle:@"Teste" Location:coordenada];
        [pin setSurvey:survey];
        if ([survey[@"no_symptom"] isEqualToString:@"Y"]) {
            [pin setNoSymptom:YES];
        } else {
            [pin setNoSymptom:NO];
        }


        
        [self.mapa addAnnotation:pin];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)
    [mapView dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
    
    CustomPin *pin = (CustomPin *) annotation;
    
   // if (!pinView) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinView"];
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        UIButton *btnPin = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = btnPin;
        
        if (pin.noSymptom) {
            pinView.pinTintColor = [UIColor greenColor];
        } else {
            pinView.pinTintColor = [UIColor redColor];
        }
   // } else {
        pinView.annotation = annotation;
  //  }
    
    return pinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *pontoView = (DetailViewController *) [mystoryboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    CustomPin *pin = (CustomPin *) view.annotation;
    [pontoView setSurvey:pin.survey];
    
    [self.navigationController pushViewController:pontoView animated:YES];
}

@end
