//
//  SurveyService.m
//  MapaSaude
//
//  Copyright © 2015 Douglas Queiroz. All rights reserved.
//

#import "SurveyService.h"

@implementation SurveyService

+(NSArray *) getSurveys {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"surveys" ofType:@"json"];
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *jsonObjects = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    
    return jsonObjects[@"data"];
}

+(NSDictionary *) getTotal{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"total" ofType:@"json"];
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *jsonObjects = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    
    return jsonObjects[@"data"];
}

@end
