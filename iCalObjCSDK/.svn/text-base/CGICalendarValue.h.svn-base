//
//  CGICalendarValue.h
//
//  Created by Satoshi Konno on 11/01/27.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
	CGICalendarValueTypeUnknown = 0,
	CGICalendarValueTypeBinary,
	CGICalendarValueTypeBoolean,
	CGICalendarValueTypeCalendarUserAddress,
	CGICalendarValueTypeDate,
	CGICalendarValueTypeDateTime,
	CGICalendarValueTypeDuration,
	CGICalendarValueTypeFloat,
	CGICalendarValueTypeInteger,
	CGICalendarValueTypePeriodOfTime,
	CGICalendarValueTypeRecurrenceRule,
	CGICalendarValueTypeText,
	CGICalendarValueTypeTime,
	CGICalendarValueTypeURI,
	CGICalendarValueTypeUTCOffset,
};

@interface CGICalendarValue : NSObject {

}
@property(assign) int type;
@property(retain) NSString *name;
@property(retain) NSString *value;

- (id)init;

- (BOOL)hasName;
- (BOOL)hasValue;

- (BOOL)isName:(NSString *)aName;
- (BOOL)isValue:(NSString *)aValue;

- (void)setObject:(id)value;
- (void)setDate:(NSDate *)value;

- (NSDate *)dateValue;
- (int)integerValue;
- (float)floatValue;

@end
