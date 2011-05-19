//
//  iCalObjCSDKTests.m
//  iCalObjCSDKTests
//
//  Created by Satoshi Konno on 11/04/08.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "iCalObjCSDKTests.h"
#import "CGICalendarContentLine.h"

@implementation iCalObjCSDKTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testValue
{
	CGICalendarValue *icalValue;
	
	icalValue = [[CGICalendarValue alloc] init];
	STAssertTrue([icalValue hasName] == NO, @"");
	[icalValue setName:@"ROLE"];
	STAssertTrue([icalValue hasName] == YES, @"");
	STAssertTrue([[icalValue name] isEqualToString:@"ROLE"], @"");
	[icalValue release];
    
	icalValue = [[CGICalendarValue alloc] init];
	STAssertTrue([icalValue hasValue] == NO, @"");
	[icalValue setValue:@"REQ-PARTICIPANT"];
	STAssertTrue([icalValue hasValue] == YES, @"");
	STAssertTrue([[icalValue value] isEqualToString:@"REQ-PARTICIPANT"], @"");
	[icalValue release];	
}

- (void)testParameter
{
	CGICalendarParameter *icalParam;
	
	icalParam = [[CGICalendarParameter alloc] initWithString:@"ROLE=REQ-PARTICIPANT"];
	STAssertTrue([[icalParam name] isEqualToString:@"ROLE"], @"");
	STAssertTrue([[icalParam value] isEqualToString:@"REQ-PARTICIPANT"], @"");
	STAssertTrue([[icalParam string] isEqualToString:@"ROLE=REQ-PARTICIPANT"], @"");
	[icalParam release];
    
	icalParam = [[CGICalendarParameter alloc] init];
	[icalParam setName:@"ROLE"];
	[icalParam setValue:@"REQ-PARTICIPANT"];
	STAssertTrue([[icalParam string] isEqualToString:@"ROLE=REQ-PARTICIPANT"], @"");
	[icalParam release];
}

- (void)testContentLine
{
	CGICalendarContentLine *icalContentLne;
	
	NSString *testContentLine = @"ATTACH;FMTTYPE=audio/basic:http://host.com/pub/audio-files/ssbanner.aud\r\n";
	icalContentLne = [[CGICalendarContentLine alloc] initWithString:testContentLine];
	STAssertTrue([[icalContentLne name] isEqualToString:@"ATTACH"], @"");
	STAssertTrue([[icalContentLne value] isEqualToString:@"http://host.com/pub/audio-files/ssbanner.aud"], @"");
	STAssertTrue([[icalContentLne parameters] count] == 1, @"");
	STAssertTrue([[icalContentLne description] isEqualToString:testContentLine], @"");
	[icalContentLne release];
}


@end
