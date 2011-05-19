//
//  iCalObjCSDKTests.m
//  iCalObjCSDKTests
//
//  Created by Satoshi Konno on 11/04/08.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "iCalObjCSDKTests.h"
#import "CGICalendar.h"
#import "CGICalendarObject.h"

@implementation iCalObjCSDKTests(Object)

- (void)testTodoObject
{
    CGICalendar *ical = [[CGICalendar alloc] init];

    CGICalendarObject *icalObj = [CGICalendarObject object];
    STAssertNotNil(icalObj, @"");
    
    STAssertTrue([[ical objects] count] == 0, @"");
    
    [ical addObject:icalObj];
    STAssertTrue([[ical objects] count] == 1, @"");
    
    [ical release];
}

@end
