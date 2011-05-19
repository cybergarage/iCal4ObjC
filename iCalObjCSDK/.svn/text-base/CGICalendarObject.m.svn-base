//
//  CGICalendarObject.m
//
//  Created by Satoshi Konno on 11/01/27.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "CGICalendarObject.h"

#define CG_ICALENDAR_OBJECT_TYPE_DEFAULT @"VCALENDAR"
#define CG_ICALENDAR_OBJECT_VERSION_PARAM @"VERSION"
#define CG_ICALENDAR_OBJECT_PRODID_PARAM @"PRODID"

@implementation CGICalendarObject

#pragma mark -
#pragma mark Global

+ (id)object
{
    return [[[CGICalendarObject alloc] init] autorelease];
}

+ (id)objectWithProdid:(NSString *)prodid
{
    return [[[CGICalendarObject alloc] initWithProdid:prodid] autorelease];
}

+ (id)objectWithProdid:(NSString *)prodid version:(NSString *)version
{
    return [[[CGICalendarObject alloc] initWithProdid:prodid version:version] autorelease];
}

#pragma mark -
#pragma mark Initialize

- (id)init
{
    if ((self = [super init])) {
        [self setType:CG_ICALENDAR_OBJECT_TYPE_DEFAULT];
        [self setVersion:CG_ICALENDAR_OBJECT_VERSION_DEFAULT];
        [self setProdid:CG_ICALENDAR_OBJECT_PRODID_DEFAULT];
    }
    return self;
}

- (id)initWithProdid:(NSString *)prodid version:(NSString *)version;
{
    if ((self = [super init])) {
        [self setType:CG_ICALENDAR_OBJECT_TYPE_DEFAULT];
        [self setVersion:version];
        [self setProdid:prodid];
    }
    return self;
}

- (id)initWithProdid:(NSString *)prodid
{
    if ((self = [super init])) {
        [self setType:CG_ICALENDAR_OBJECT_TYPE_DEFAULT];
        [self setVersion:CG_ICALENDAR_OBJECT_VERSION_DEFAULT];
        [self setProdid:prodid];
    }
    return self;
}

#pragma mark -
#pragma mark Property Utility Methods

- (void)setVersion:(NSString *)version
{
    [self setPropertyValue:version forName:CG_ICALENDAR_OBJECT_VERSION_PARAM];
}

- (NSString *)version
{
    return [self propertyValueForName:CG_ICALENDAR_OBJECT_VERSION_PARAM];
}

- (void)setProdid:(NSString *)prodid
{
    [self setPropertyValue:prodid forName:CG_ICALENDAR_OBJECT_PRODID_PARAM];
}

- (NSString *)prodid
{
    return [self propertyValueForName:CG_ICALENDAR_OBJECT_PRODID_PARAM];
}

#pragma mark -
#pragma mark conponents

- (NSArray *)componentsWithType:(NSString *)type
{
    NSMutableArray *typeComponents = [NSMutableArray array];
    for (CGICalendarComponent *icalComponent in [self components]) {
        if ([icalComponent isType:type] == NO)
            continue;
        [typeComponents addObject:icalComponent];
    }
    return typeComponents;
}

- (NSArray *)events
{
    return [self componentsWithType:CG_ICALENDAR_COMPONENT_TYPE_EVENT];
}

- (NSArray *)todos
{
    return [self componentsWithType:CG_ICALENDAR_COMPONENT_TYPE_TODO];
}

- (NSArray *)journals
{
    return [self componentsWithType:CG_ICALENDAR_COMPONENT_TYPE_JOURNAL];
}

- (NSArray *)freebusies
{
    return [self componentsWithType:CG_ICALENDAR_COMPONENT_TYPE_FREEBUSY];
}

- (NSArray *)timezones
{
    return [self componentsWithType:CG_ICALENDAR_COMPONENT_TYPE_TIMEZONE];
}

@end
