//
//  CGICalendarObject.h
//
//  Created by Satoshi Konno on 11/01/27.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CGICalendarComponent.h"
#import "CGICalendarProperty.h"

#define CG_ICALENDAR_OBJECT_VERSION_DEFAULT @"2.0"
#define CG_ICALENDAR_OBJECT_PRODID_DEFAULT @"//CyberGarage//iCal4ObjC//EN"

@interface CGICalendarObject : CGICalendarComponent {
    
}

+ (id)object;
+ (id)objectWithProdid:(NSString *)prodid;
+ (id)objectWithProdid:(NSString *)prodid version:(NSString *)version;

- (id)init;
- (id)initWithProdid:(NSString *)prodid;
- (id)initWithProdid:(NSString *)prodid version:(NSString *)version;

- (void)setVersion:(NSString *)version;
- (NSString *)version;

- (void)setProdid:(NSString *)prodid;
- (NSString *)prodid;

- (NSArray *)componentsWithType:(NSString *)type;
- (NSArray *)events;
- (NSArray *)todos;
- (NSArray *)journals;
- (NSArray *)freebusies;
- (NSArray *)timezones;

@end

