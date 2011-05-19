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

- (void)testNSDate
{
    NSDate *icalDate = [NSDate dateWithICalendarString:@"20110513T231201"];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"YYYY-MM-dd kk:mm:ss"];
    NSDate *iso8601Date = [dateFormatter dateFromString:@"2011-05-13 23:12:01"];
    
    STAssertTrue([icalDate compare:iso8601Date] == NSOrderedSame, @"");
    STAssertTrue([[icalDate descriptionICalendar] isEqualToString:@"20110513T231201"], @"");
}

@end
