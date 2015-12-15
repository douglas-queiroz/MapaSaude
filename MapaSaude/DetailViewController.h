//
//  DetailViewController.h
//  MapaSaude
//
//  Copyright © 2015 Douglas Queiroz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChart.h"

@interface DetailViewController : UIViewController<PNChartDelegate>

@property(nonatomic, weak) NSDictionary *survey;
@property (nonatomic) PNPieChart *pieChart;

@end
