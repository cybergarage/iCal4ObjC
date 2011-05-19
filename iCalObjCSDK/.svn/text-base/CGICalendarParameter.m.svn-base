//
//  CGICalendarParameter.m
//
//  Created by Satoshi Konno on 11/01/27.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "CGICalendarParameter.h"

#define CG_ICALENDAR_PARAMETER_DELIM @"="

@implementation CGICalendarParameter

- (id)init
{
	if ((self = [super init])) {
	}
	return self;
}

- (id)initWithString:(NSString *)aString
{
	if ((self = [self init])) {
		[self setString:aString];
	}
	return self;
}

- (void)setString:(NSString *)aString
{
	NSArray *values = [aString componentsSeparatedByString:CG_ICALENDAR_PARAMETER_DELIM];
	if ([values count] < 2)
		return;
	[self setName:[values objectAtIndex:0]];
	[self setValue:[values objectAtIndex:1]];
}

- (NSString *) string;
{
	return [NSString stringWithFormat:@"%@%@%@",
			[self name] ? [self name] : @"",
			CG_ICALENDAR_PARAMETER_DELIM,
			[self value] ? [self value] : @""];
}

@end
