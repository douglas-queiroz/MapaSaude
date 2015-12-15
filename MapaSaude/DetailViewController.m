//
//  DetailViewController.m
//  MapaSaude
//
//  Copyright © 2015 Douglas Queiroz. All rights reserved.
//

#import "DetailViewController.h"
#import "SurveyService.h"

@interface DetailViewController ()

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *total = [SurveyService getTotal];
    
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:[total[@"no_symptom"] integerValue] color:PNGreen description:@"No Symptom"],
                       [PNPieChartDataItem dataItemWithValue:[total[@"symptom"] integerValue] color:PNRed description:@"Sick"],
                       ];
    
    self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /2.0 - 100, 135, 200.0, 200.0) items:items];
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
    self.pieChart.showAbsoluteValues = NO;
    self.pieChart.showOnlyValues = NO;
    [self.pieChart strokeChart];
    
    
    self.pieChart.legendStyle = PNLegendItemStyleStacked;
    self.pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    UIView *legend = [self.pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
    [self.view addSubview:legend];
    
    [self.view addSubview:self.pieChart];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
