//
//  iCalObjCSDKTests.m
//  iCalObjCSDKTests
//
//  Created by Satoshi Konno on 11/04/08.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "iCalObjCSDKTests.h"
#import "CGICalendar.h"

@implementation iCalObjCSDKTests(NSDate)

- (void)testNSDate {
	NSDate *icalDate = [NSDate dateWithICalendarString:@"20110513T231201Z"];
	NSDate *iso8601Date = [NSDate dateWithICalendarISO8601:@"2011-05-13 23:12:01"];
	STAssertEqualObjects(icalDate, iso8601Date, @"");
	STAssertEqualObjects([icalDate descriptionICalendar], @"20110513T231201Z", @"");
}

@end
