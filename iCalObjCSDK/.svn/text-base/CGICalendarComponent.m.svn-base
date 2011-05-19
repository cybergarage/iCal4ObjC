//
//  CGICalendarComponent.m
//
//  Created by Satoshi Konno on 11/01/27.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "CGICalendar.h"
#import "CGICalendarComponent.h"
#import "CGICalendarContentLine.h"
#import "NSDate+CGICalendar.h"

#define CG_ICALENDAR_COMPONENT_SEQUENCE_DEFAULT 0

@implementation CGICalendarComponent

@synthesize type;
@synthesize components;
@synthesize properties;

#pragma mark -
#pragma mark Global methods

+ (id)componentWithType:(NSString *)aType
{
    return [[[CGICalendarComponent alloc] initWithType:aType] autorelease];
}

+ (id)event
{
    CGICalendarComponent *icalComp = [CGICalendarComponent componentWithType:CG_ICALENDAR_COMPONENT_TYPE_EVENT];
    [icalComp setUID:[CGICalendar UUID]];
    [icalComp setDateTimeStamp:[NSDate date]];
    [icalComp setSequenceNumber:CG_ICALENDAR_COMPONENT_SEQUENCE_DEFAULT];
    return icalComp;
}

+ (id)todo
{
    CGICalendarComponent *icalComp = [CGICalendarComponent componentWithType:CG_ICALENDAR_COMPONENT_TYPE_TODO];
    [icalComp setUID:[CGICalendar UUID]];
    [icalComp setDateTimeStamp:[NSDate date]];
    [icalComp setSequenceNumber:CG_ICALENDAR_COMPONENT_SEQUENCE_DEFAULT];
    [icalComp setCreated:[NSDate date]];
    return icalComp;
}

+ (id)journal
{
    CGICalendarComponent *icalComp = [CGICalendarComponent componentWithType:CG_ICALENDAR_COMPONENT_TYPE_JOURNAL];
    [icalComp setUID:[CGICalendar UUID]];
    [icalComp setDateTimeStamp:[NSDate date]];
    [icalComp setSequenceNumber:CG_ICALENDAR_COMPONENT_SEQUENCE_DEFAULT];
    return icalComp;
}

+ (id)freebusy
{
    CGICalendarComponent *icalComp = [CGICalendarComponent componentWithType:CG_ICALENDAR_COMPONENT_TYPE_FREEBUSY];
    [icalComp setUID:[CGICalendar UUID]];
    [icalComp setDateTimeStamp:[NSDate date]];
    return icalComp;
}

+ (id)timezone
{
    CGICalendarComponent *icalComp = [CGICalendarComponent componentWithType:CG_ICALENDAR_COMPONENT_TYPE_TIMEZONE];
    return icalComp;
}

+ (id)alarm
{
    CGICalendarComponent *icalComp = [CGICalendarComponent componentWithType:CG_ICALENDAR_COMPONENT_TYPE_ALARM];
    return icalComp;
}

#pragma mark -
#pragma mark init

- (id)init
{
    if ((self = [super init])) {
        [self setComponents:[NSMutableArray array]];
        [self setProperties:[NSMutableArray array]];
    }
    return self;
}

- (id)initWithType:(NSString *)aType
{
    if ((self = [self init])) {
        [self setType:aType];
    }
    return self;
}

#pragma mark -
#pragma mark Component

- (void)addComponent:(CGICalendarComponent *)component
{
    [[self components] addObject:component];
}

- (void)insertComponent:(CGICalendarComponent *)component atIndex:(NSUInteger)index
{
    [[self components] insertObject:component atIndex:index];
}

- (CGICalendarComponent *)componentAtIndex:(NSUInteger)index
{
    return [[self components] objectAtIndex:index];
}

- (NSUInteger)indexOfComponent:(CGICalendarComponent *)component
{
    return [[self components] indexOfObject:component];
}

- (void)removeComponent:(CGICalendarComponent *)component
{
    [[self components] removeObject:component];
}

- (void)removeComponentAtIndex:(NSUInteger)index
{
    [[self components] removeObjectAtIndex:index];
}

#pragma mark -
#pragma mark Property

- (BOOL)hasPropertyForName:(NSString *)name
{
    for (CGICalendarProperty *icalProp in [self properties]) {
        if ([icalProp isName:name]) {
            [[self properties] removeObject:icalProp];
            return YES;
        }
    }
    return NO;
}

- (void)addProperty:(CGICalendarProperty *)property
{
    [[self properties] addObject:property];
}

- (void)removePropertyForName:(NSString *)name
{
    for (CGICalendarProperty *icalProp in [self properties]) {
        if ([icalProp isName:name]) {
            [[self properties] removeObject:icalProp];
            return;
        }
    }
}

- (void)setPropertyValue:(NSString *)value forName:(NSString *)name
{
    [self setPropertyValue:value forName:name parameterValues:[NSArray array] parameterNames:[NSArray array]];
}

- (void)setPropertyValue:(NSString *)value forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;
{
    CGICalendarProperty *icalProp = [self propertyForName:name];
    if (icalProp == nil) {
        icalProp = [[[CGICalendarProperty alloc] init] autorelease];
        [icalProp setName:name];
        [self addProperty:icalProp];
    }
    [icalProp setValue:value];
    
    if ([parameterValues count] != [parameterNames count])
        return;
    
    for (int n=0; n<[parameterNames count]; n++) {
        NSString *name = [parameterNames objectAtIndex:n];
        id value = [parameterNames objectAtIndex:n];
        [icalProp setParameterObject:value forName:name];
    }
}

- (void)setPropertyObject:(id)object forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames
{
    [self setPropertyValue:[object description] forName:name parameterValues:parameterValues parameterNames:parameterNames];
}

- (void)setPropertyObject:(id)object forName:(NSString *)name
{
    [self setPropertyValue:[object description] forName:name];
}

- (void)setPropertyDate:(NSDate *)object forName:(NSString *)name
{
    [self setPropertyValue:[object descriptionICalendar] forName:name];
}

- (void)setPropertyDate:(NSDate *)object forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames
{
    [self setPropertyValue:[object descriptionICalendar] forName:name parameterValues:parameterValues parameterNames:parameterNames];
}

- (void)setPropertyInteger:(int)value forName:(NSString *)name
{
    [self setPropertyValue:[[NSNumber numberWithInteger:value] stringValue] forName:name];
}

- (void)setPropertyInteger:(int)value forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames
{
    [self setPropertyValue:[[NSNumber numberWithInteger:value] stringValue] forName:name parameterValues:parameterValues parameterNames:parameterNames];
}

- (void)setPropertyFloat:(float)value forName:(NSString *)name
{
    [self setPropertyValue:[[NSNumber numberWithFloat:value] stringValue] forName:name];
}

- (void)setPropertyFloat:(float)value forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames
{
    [self setPropertyValue:[[NSNumber numberWithFloat:value] stringValue] forName:name parameterValues:parameterValues parameterNames:parameterNames];
}

- (id)propertyAtIndex:(NSUInteger)index
{
    return [[self properties] objectAtIndex:index];
}

- (CGICalendarProperty *)propertyForName:(NSString *)name
{
    for (CGICalendarProperty *icalProp in [self properties]) {
        if ([icalProp isName:name])
            return icalProp;
    }
    return nil;
}

- (NSArray *)allPropertyKeys
{
    NSMutableArray *keys = [NSMutableArray array];
    for (CGICalendarProperty *icalProp in [self properties])
        [keys addObject:[icalProp name]];
    return keys;
}

- (NSString *)propertyValueForName:(NSString *)name
{
    for (CGICalendarProperty *icalProp in [self properties]) {
        if ([icalProp isName:name])
            return [icalProp value];
    }
    return nil;
}

- (NSDate *)propertyDateForName:(NSString *)name
{
    for (CGICalendarProperty *icalProp in [self properties]) {
        if ([icalProp isName:name])
            return [icalProp dateValue];
    }
    return nil;
}

- (int)propertyIntegerForName:(NSString *)name;
{
    for (CGICalendarProperty *icalProp in [self properties]) {
        if ([icalProp isName:name])
            return [icalProp integerValue];
    }
    return 0;
}

- (float)propertyFloatForName:(NSString *)name;
{
    for (CGICalendarProperty *icalProp in [self properties]) {
        if ([icalProp isName:name])
            return [icalProp floatValue];
    }
    return 0;
}

#pragma mark -
#pragma mark String

- (BOOL)isType:(NSString *)aType
{
    return [aType isEqualToString:[self type]];
}

- (BOOL)isEvent
{
    return [self isType:CG_ICALENDAR_COMPONENT_TYPE_EVENT];
}

- (BOOL)isTodo
{
    return [self isType:CG_ICALENDAR_COMPONENT_TYPE_TODO];
}

- (BOOL)isJournal
{
    return [self isType:CG_ICALENDAR_COMPONENT_TYPE_JOURNAL];
}

- (BOOL)isFreebusy
{
    return [self isType:CG_ICALENDAR_COMPONENT_TYPE_FREEBUSY];
}

- (BOOL)isTimezone
{
    return [self isType:CG_ICALENDAR_COMPONENT_TYPE_TIMEZONE];
}

- (BOOL)isAlarm
{
    return [self isType:CG_ICALENDAR_COMPONENT_TYPE_ALARM];
}

#pragma mark -
#pragma mark String

#define CG_ICALENDAR_CONTENTLINE_NAME_BEGIN @"BEGIN"
#define CG_ICALENDAR_CONTENTLINE_NAME_END @"END"

- (NSString *)description
{
    NSMutableString *objectsString = [NSMutableString string];
    
    [objectsString appendFormat:@"%@:%@%@",CG_ICALENDAR_CONTENTLINE_NAME_BEGIN, [self type], CG_ICALENDAR_CONTENTLINE_TERM];
    
    for (CGICalendarProperty *icalProp in [self properties])
        [objectsString appendString:[icalProp description]];
    
    for (CGICalendarComponent *icalComp in [self components])
        [objectsString appendString:[icalComp description]];
    
    [objectsString appendFormat:@"%@:%@%@",CG_ICALENDAR_CONTENTLINE_NAME_END, [self type], CG_ICALENDAR_CONTENTLINE_TERM];
    
    return objectsString;
}

#pragma mark -
#pragma mark 4.2.12 Participation Status

- (void)setParticipationStatus:(int)status
{
    CGICalendarProperty *icalProp = [self propertyForName:CG_ICALENDAR_PROERTY_PARTSTAT];
    if (icalProp == nil)
        icalProp = [[[CGICalendarProperty alloc] init] autorelease];
    [icalProp setParticipationStatus:status];
}

- (int)participationStatus
{
    CGICalendarProperty *icalProp = [self propertyForName:CG_ICALENDAR_PROERTY_PARTSTAT];
    if (icalProp == nil)
        return CGICalendarParticipationStatusUnkown;
    return [icalProp participationStatus];
}

#pragma mark -
#pragma mark 4.8.1.5 Description

- (void)setNotes:(NSString *)value
{
    [self setPropertyValue:value forName:CG_ICALENDAR_PROERTY_DESCRIPTION];
}

- (NSString *)notes
{
    return [self propertyValueForName:CG_ICALENDAR_PROERTY_DESCRIPTION];
}

#pragma mark -
#pragma mark 4.8.1.9 Priority

- (void)setPriority:(NSUInteger)value
{
    [self setPropertyInteger:value forName:CG_ICALENDAR_PROERTY_PRIORITY];
}

- (NSUInteger)priority
{
    return [self propertyIntegerForName:CG_ICALENDAR_PROERTY_PRIORITY];
}

#pragma mark -
#pragma mark 4.8.1.12 Summary

- (void)setSummary:(NSString *)value
{
    [self setPropertyValue:value forName:CG_ICALENDAR_PROERTY_SUMMARY];
}

- (NSString *)summary
{
    return [self propertyValueForName:CG_ICALENDAR_PROERTY_SUMMARY];
}

#pragma mark -
#pragma mark 4.8.2.1 Date/Time Completed

- (void)setCompleted:(NSDate *)value
{
    [self setPropertyDate:value forName:CG_ICALENDAR_PROERTY_COMPLETED];
}

- (NSDate *)completed
{
    return [self propertyDateForName:CG_ICALENDAR_PROERTY_COMPLETED];
}

#pragma mark -
#pragma mark 4.8.2.2 Date/Time End

- (void)setDateTimeEnd:(NSDate *)value
{
    [self setPropertyDate:value forName:CG_ICALENDAR_PROERTY_DTEND];
}

- (NSDate *)dateTimeEnd
{
    return [self propertyDateForName:CG_ICALENDAR_PROERTY_DTEND];
}

#pragma mark -
#pragma mark 4.8.2.3 Date/Time Due

- (void)setDue:(NSDate *)value
{
    [self setPropertyDate:value forName:CG_ICALENDAR_PROERTY_DUE];
}

- (NSDate *)due
{
    return [self propertyDateForName:CG_ICALENDAR_PROERTY_DUE];
}

#pragma mark -
#pragma mark 4.8.2.4 Date/Time Start

- (void)setDateTimeStart:(NSDate *)value
{
    [self setPropertyDate:value forName:CG_ICALENDAR_PROERTY_DTSTART];
}

- (NSDate *)dateTimeStart
{
    return [self propertyDateForName:CG_ICALENDAR_PROERTY_DTSTART];
}

#pragma mark -
#pragma mark 4.8.4.7 Unique Identifier

- (void)setUID:(NSString *)value
{
    [self setPropertyValue:value forName:CG_ICALENDAR_PROERTY_UID];
}

- (NSString *)UID
{
    return [self propertyValueForName:CG_ICALENDAR_PROERTY_UID];
}

#pragma mark -
#pragma mark 4.8.7.1 Date/Time Created

- (void)setCreated:(NSDate *)value
{
    [self setPropertyDate:value forName:CG_ICALENDAR_PROERTY_CREATED];
}

- (NSDate *)created
{
    return [self propertyDateForName:CG_ICALENDAR_PROERTY_CREATED];
}

#pragma mark -
#pragma mark 4.8.7.2 Date/Time Stamp

- (void)setDateTimeStamp:(NSDate *)value
{
    [self setPropertyDate:value forName:CG_ICALENDAR_PROERTY_DTSTAMP];
}

- (NSDate *)dateTimeStamp
{
    return [self propertyDateForName:CG_ICALENDAR_PROERTY_DTSTAMP];
}

#pragma mark -
#pragma mark 4.8.7.3 Last Modified

- (void)setLastModified:(NSDate *)value;
{
    [self setPropertyDate:value forName:CG_ICALENDAR_PROERTY_LASTMODIFIED];
}

- (NSDate *)lastModified;
{
    return [self propertyDateForName:CG_ICALENDAR_PROERTY_LASTMODIFIED];
}

#pragma mark -
#pragma mark 4.8.7.4 Sequence Number

- (void)setSequenceNumber:(NSUInteger)value
{
    [self setPropertyInteger:value forName:CG_ICALENDAR_PROERTY_SEQUENCE];
}

- (NSUInteger)sequenceNumber
{
    return [self propertyIntegerForName:CG_ICALENDAR_PROERTY_SEQUENCE];
}

- (void)incrementSequenceNumber
{
    [self setSequenceNumber:([self sequenceNumber] + 1)];
}

@end
