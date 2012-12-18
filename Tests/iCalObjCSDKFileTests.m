//
//  iCalObjCSDKFileTests.m
//  iCalObjCSDKTests
//
//  Created by Satoshi Konno on 11/04/08.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "iCalObjCSDKTests.h"
#import "CGICalendar.h"

@implementation iCalObjCSDKTests(File)

NSString * const CGICalObjCSDKTTestsFileSample01 = \
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

NSString * const CGICalObjCSDKTTestsFileName01 = @"sample.ical";

- (void)testWriteFile {
	CGICalendar *ical = [[CGICalendar alloc] init];
	BOOL parseResult = [ical parseWithString:CGICalObjCSDKTTestsFileSample01 error:nil];
	STAssertTrue(parseResult, @"");

	NSString *tmpFilename = [NSTemporaryDirectory() stringByAppendingPathComponent:CGICalObjCSDKTTestsFileName01];
	BOOL wroteResult = [ical writeToFile:tmpFilename];
	STAssertTrue(wroteResult, @"");
	parseResult = [ical parseWithString:CGICalObjCSDKTTestsFileSample01 error:nil];
	STAssertTrue(parseResult, @"");
}

@end
