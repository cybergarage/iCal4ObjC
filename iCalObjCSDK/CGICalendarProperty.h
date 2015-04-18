//
//  CGICalendarProperty.h
//
//  Created by Satoshi Konno on 11/01/27.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGICalendarValue.h"
#import "CGICalendarParameter.h"

#define CG_ICALENDAR_PROPERTY_PARTSTAT @"PARTSTAT"

#define CG_ICALENDAR_PROPERTY_COMPLETED @"COMPLETED"
#define CG_ICALENDAR_PROPERTY_DTEND @"DTEND"
#define CG_ICALENDAR_PROPERTY_DUE @"DUE"
#define CG_ICALENDAR_PROPERTY_DTSTART @"DTSTART"
#define CG_ICALENDAR_PROPERTY_RECURRENCE_ID @"RECURRENCE-ID"

// 4.8.1 Descriptive Component Properties

#define CG_ICALENDAR_PROPERTY_DESCRIPTION @"DESCRIPTION"
#define CG_ICALENDAR_PROPERTY_PRIORITY @"PRIORITY"
#define CG_ICALENDAR_PROPERTY_SUMMARY @"SUMMARY"

// 4.8.4 Relationship Component Properties
#define CG_ICALENDAR_PROPERTY_UID @"UID"

// 4.8.7 Change Management Component Properties

#define CG_ICALENDAR_PROPERTY_CREATED @"CREATED"
#define CG_ICALENDAR_PROPERTY_DTSTAMP @"DTSTAMP"
#define CG_ICALENDAR_PROPERTY_LASTMODIFIED @"LAST-MODIFIED"
#define CG_ICALENDAR_PROPERTY_SEQUENCE @"SEQUENCE"

enum {
	CGICalendarParticipationStatusUnkown = 0,
	CGICalendarParticipationStatusNeedsAction,
	CGICalendarParticipationStatusAccepted,
	CGICalendarParticipationStatusDeclined,
	CGICalendarParticipationStatusTentative,
	CGICalendarParticipationStatusDelegated,
	CGICalendarParticipationStatusCompleted,
	CGICalendarParticipationStatusInProcess,
};

@interface CGICalendarProperty : CGICalendarValue {
}
@property(strong) NSMutableArray *parameters;

- (id)init;

- (BOOL)hasParameterForName:(NSString *)name;
- (void)addParameter:(CGICalendarParameter *)parameter;
- (void)removeParameterForName:(NSString *)name;

- (void)setParameterValue:(NSString *)value forName:(NSString *)name;
- (void)setParameterValue:(NSString *)value forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;
- (void)setParameterObject:(id)object forName:(NSString *)name;
- (void)setParameterObject:(id)object forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;
- (void)setParameterDate:(NSDate *)object forName:(NSString *)name;
- (void)setParameterDate:(NSDate *)object forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;
- (void)setParameterInteger:(NSInteger)value forName:(NSString *)name;
- (void)setParameterInteger:(NSInteger)value forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;
- (void)setParameterFloat:(float)value forName:(NSString *)name;
- (void)setParameterFloat:(float)value forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;

- (CGICalendarParameter *)parameterAtIndex:(NSUInteger)index;
- (CGICalendarParameter *)parameterForName:(NSString *)name;
- (NSArray *)allParameterKeys;
- (NSString *)parameterValueForName:(NSString *)name;
- (NSDate *)parameterDateForName:(NSString *)name;
- (NSInteger)parameterIntegerForName:(NSString *)name;
- (float)parameterFloatForName:(NSString *)name;

- (void)setParticipationStatus:(int)value;
- (int)participationStatus;

- (NSString *)foldPropertyLine:(NSString *)line;

@end
