//
//  NSDate+CGICalendar.m
//
//  Created by Satoshi Konno on 5/12/11.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "NSDate+CGICalendar.h"

#define CGNSDATE_ICALENDAR_DATETMEFORMAT @"YYYYMMdd'T'kkmmss'Z'"
#define CGNSDATE_ISO8601_DATETMEFORMAT @"YYYY-MM-dd kk:mm:ss"

@implementation NSDate(CGICalendar)

+ (id)dateWithICalendarString:(NSString *)aString
{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
	[dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:CGNSDATE_ICALENDAR_DATETMEFORMAT];
    return [dateFormatter dateFromString:aString];
}

+ (id)dateWithICalendarISO8601:(NSString *)aString
{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:CGNSDATE_ISO8601_DATETMEFORMAT];
    return [dateFormatter dateFromString:aString];
}

- (NSString *)descriptionICalendar
{
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
	[dateFormatter setTimeZone:timeZone];
	[dateFormatter setDateFormat:CGNSDATE_ICALENDAR_DATETMEFORMAT];
	return [dateFormatter stringFromDate:self];
}

- (NSString *)descriptionISO8601
{
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setLocale:[NSLocale systemLocale]];
	[dateFormatter setDateFormat:CGNSDATE_ISO8601_DATETMEFORMAT];
	return [dateFormatter stringFromDate:self];
}

@end 
