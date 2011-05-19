//
//  CGICalendarComponent.h
//
//  Created by Satoshi Konno on 11/01/27.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGICalendarProperty.h"

#define CG_ICALENDAR_COMPONENT_TYPE_EVENT @"VEVENT"
#define CG_ICALENDAR_COMPONENT_TYPE_TODO @"VTODO"
#define CG_ICALENDAR_COMPONENT_TYPE_JOURNAL @"VJOURNAL"
#define CG_ICALENDAR_COMPONENT_TYPE_FREEBUSY @"VFREEBUSY"
#define CG_ICALENDAR_COMPONENT_TYPE_TIMEZONE @"VTIMEZONE"
#define CG_ICALENDAR_COMPONENT_TYPE_ALARM @"VALARM"

@interface CGICalendarComponent : NSObject {

}
@property(retain) NSString *type;
@property(retain) NSMutableArray *components;
@property(retain) NSMutableArray *properties;

+ (id)componentWithType:(NSString *)type;
+ (id)event;
+ (id)todo;
+ (id)journal;
+ (id)freebusy;
+ (id)timezone;
+ (id)alarm;

- (id)initWithType:(NSString *)type;

- (BOOL)isType:(NSString *)type;
- (BOOL)isEvent;
- (BOOL)isTodo;
- (BOOL)isJournal;
- (BOOL)isFreebusy;
- (BOOL)isTimezone;
- (BOOL)isAlarm;

- (void)addComponent:(CGICalendarComponent *)component;
- (void)insertComponent:(CGICalendarComponent *)component atIndex:(NSUInteger)index;
- (CGICalendarComponent *)componentAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfComponent:(CGICalendarComponent *)component;
- (void)removeComponent:(CGICalendarComponent *)component;
- (void)removeComponentAtIndex:(NSUInteger)index;

- (BOOL)hasPropertyForName:(NSString *)name;
- (void)addProperty:(CGICalendarProperty *)property;
- (void)removePropertyForName:(NSString *)name;

- (void)setPropertyValue:(NSString *)value forName:(NSString *)name;
- (void)setPropertyValue:(NSString *)value forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;
- (void)setPropertyObject:(id)object forName:(NSString *)name;
- (void)setPropertyObject:(id)object forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;
- (void)setPropertyDate:(NSDate *)object forName:(NSString *)name;
- (void)setPropertyDate:(NSDate *)object forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;
- (void)setPropertyInteger:(int)value forName:(NSString *)name;
- (void)setPropertyInteger:(int)value forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;
- (void)setPropertyFloat:(float)value forName:(NSString *)name;
- (void)setPropertyFloat:(float)value forName:(NSString *)name parameterValues:(NSArray *)parameterValues parameterNames:(NSArray *)parameterNames;

- (NSArray *)allPropertyKeys;
- (CGICalendarProperty *)propertyAtIndex:(NSUInteger)index;
- (CGICalendarProperty *)propertyForName:(NSString *)name;

- (NSString *)propertyValueForName:(NSString *)name;
- (NSDate *)propertyDateForName:(NSString *)name;
- (int)propertyIntegerForName:(NSString *)name;
- (float)propertyFloatForName:(NSString *)name;

- (NSString *)description;

// 4.2.12 Participation Status
- (void)setParticipationStatus:(int)status;
- (int)participationStatus;

// 4.8.1.5 Description
- (void)setNotes:(NSString *)value;
- (NSString *)notes;

// 4.8.1.9 Priority
- (void)setPriority:(NSUInteger)value;
- (NSUInteger)priority;

// 4.8.1.12 Summary
- (void)setSummary:(NSString *)value;
- (NSString *)summary;

// 4.8.2.1 Date/Time Completed
- (void)setCompleted:(NSDate *)value;
- (NSDate *)completed;

// 4.8.2.2 Date/Time End
- (void)setDateTimeEnd:(NSDate *)value;
- (NSDate *)dateTimeEnd;

// 4.8.2.3 Date/Time Due
- (void)setDue:(NSDate *)value;
- (NSDate *)due;

// 4.8.2.4 Date/Time Start
- (void)setDateTimeStart:(NSDate *)value;
- (NSDate *)dateTimeStart;

// 4.8.4.7 Unique Identifier
- (void)setUID:(NSString *)value;
- (NSString *)UID;

// 4.8.7.1 Date/Time Created
- (void)setCreated:(NSDate *)value;
- (NSDate *)created;

// 4.8.7.2 Date/Time Stamp
- (void)setDateTimeStamp:(NSDate *)value;
- (NSDate *)dateTimeStamp;

// 4.8.7.3 Last Modified
- (void)setLastModified:(NSDate *)value;
- (NSDate *)lastModified;

// 4.8.7.4 Sequence Number
- (void)setSequenceNumber:(NSUInteger)value;
- (NSUInteger)sequenceNumber;
- (void)incrementSequenceNumber;

@end
