//
//  iCalObjCSDKTests.m
//  iCalObjCSDKTests
//
//  Created by Satoshi Konno on 11/04/08.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "iCalObjCSDKTests.h"
#import "CGICalendar.h"

@implementation iCalObjCSDKTests(VTODO)

NSString * const CGICalObjCSDKTTestsVtodoSample01 = \
@"BEGIN:VCALENDAR\r\n" \
@"VERSION:2.0\r\n" \
@"PRODID:-//ABC Corporation//NONSGML My Product//EN\r\n" \
@"BEGIN:VTODO\r\n" \
@"DTSTAMP:19980130T134500Z\r\n" \
@"SEQUENCE:2\r\n" \
@"UID:uid4@host1.com\r\n" \
@"ORGANIZER:MAILTO:unclesam@us.gov\r\n" \
@"ATTENDEE;PARTSTAT=ACCEPTED:MAILTO:jqpublic@example.com\r\n" \
@"DUE:19980415T235959\r\n" \
@"STATUS:NEEDS-ACTION\r\n" \
@"SUMMARY:Submit Income Taxes\r\n" \
@"BEGIN:VALARM\r\n" \
@"ACTION:AUDIO\r\n" \
@"TRIGGER:19980403T120000\r\n" \
@"ATTACH;FMTTYPE=audio/basic:http://example.com/pub/audio-\r\n" \
@" files/ssbanner.aud\r\n" \
@"REPEAT:4\r\n" \
@"DURATION:PT1H\r\n" \
@"END:VALARM\r\n" \
@"END:VTODO\r\n" \
@"END:VCALENDAR\r\n";

NSString * const CGICalObjCSDKTTestsVtodoSample01Version = @"2.0";
NSString * const CGICalObjCSDKTTestsVtodoSample01Prodid = @"-//ABC Corporation//NONSGML My Product//EN";

- (void)testTodoParseSample01 {
	CGICalendar *ical = [[CGICalendar alloc] init];
	BOOL parseResult = [ical parseWithString:CGICalObjCSDKTTestsVtodoSample01 error:nil];
	STAssertTrue(parseResult, @"");
	NSLog(@"%@", [ical description]);
	NSArray *objects = [ical objects];
	STAssertNotNil(objects, @"");
	STAssertTrue([objects count] == 1, @"");
	CGICalendarObject *icalObj = [objects objectAtIndex:0];
	STAssertTrue(icalObj == [ical objectAtIndex:0], @"");
	STAssertTrue([[icalObj version] isEqualToString:CGICalObjCSDKTTestsVtodoSample01Version], @"");
	STAssertTrue([[icalObj prodid] isEqualToString:CGICalObjCSDKTTestsVtodoSample01Prodid], @"");
	NSArray *components = [icalObj components];
	STAssertNotNil(components, @"");
	STAssertTrue([components count] == 1, @"");
	CGICalendarComponent *icalComp = [icalObj componentAtIndex:0];
	STAssertNotNil(icalComp, @"");
	STAssertTrue([icalComp isTodo], @"");
}

- (void)testTodoMakeSample01 {
	CGICalendar *ical = [[CGICalendar alloc] init];
	CGICalendarObject *icalObj = [CGICalendarObject objectWithProdid:CGICalObjCSDKTTestsVtodoSample01Prodid version:CGICalObjCSDKTTestsVtodoSample01Version];
	[ical addObject:icalObj];

	CGICalendarComponent *icalTodo = [CGICalendarComponent todo];
	STAssertNotNil(icalTodo, @"");
	STAssertTrue([icalTodo isTodo], @"");
	[icalObj addComponent:icalTodo];

	CGICalendarComponent *icalAlarm = [CGICalendarComponent alarm];
	STAssertNotNil(icalAlarm, @"");
	STAssertTrue([icalAlarm isAlarm], @"");
	[icalTodo addComponent:icalAlarm];
	NSLog(@"%@", [ical description]);
}

@end
