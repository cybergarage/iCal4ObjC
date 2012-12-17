//
//  iCalObjCSDKTests.m
//  iCalObjCSDKTests
//
//  Created by Satoshi Konno on 11/04/08.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "iCalObjCSDKTests.h"
#import "CGICalendarComponent.h"

@implementation iCalObjCSDKTests(Property)

NSString * const CGICalObjCSDKTTestsPropertySample01Key = @"TESTKEY";
NSString * const CGICalObjCSDKTTestsPropertySample01Value = @"TESTVALUE";

- (void)testPropertyAdd {
	CGICalendarComponent *icalComp = [[CGICalendarComponent alloc] init];
	STAssertEquals([[icalComp properties] count], (NSUInteger)0, @"");
	STAssertNil([icalComp propertyValueForName:CGICalObjCSDKTTestsPropertySample01Key], @"");
	STAssertFalse([icalComp hasPropertyForName:CGICalObjCSDKTTestsPropertySample01Key], @"");
	[icalComp setPropertyValue:CGICalObjCSDKTTestsPropertySample01Value forName:CGICalObjCSDKTTestsPropertySample01Key];
	STAssertEquals([[icalComp properties] count], (NSUInteger)1, @"");
	STAssertNotNil([icalComp propertyValueForName:CGICalObjCSDKTTestsPropertySample01Key], @"");
	STAssertEqualObjects([icalComp propertyValueForName:CGICalObjCSDKTTestsPropertySample01Key], CGICalObjCSDKTTestsPropertySample01Value, @"");
	STAssertTrue([icalComp hasPropertyForName:CGICalObjCSDKTTestsPropertySample01Key], @"");
	[icalComp removePropertyForName:CGICalObjCSDKTTestsPropertySample01Key];
	STAssertEquals([[icalComp properties] count], (NSUInteger)0, @"");
	STAssertNil([icalComp propertyValueForName:CGICalObjCSDKTTestsPropertySample01Key], @"");
	STAssertFalse([icalComp hasPropertyForName:CGICalObjCSDKTTestsPropertySample01Key], @"");
}

- (void)testPropertyParticipationStatus {
	for (NSUInteger n = CGICalendarParticipationStatusUnkown; n <= CGICalendarParticipationStatusInProcess; n++) {
		CGICalendarProperty *icalProp = [[CGICalendarProperty alloc] init];
		[icalProp setParticipationStatus:n];
		STAssertEquals([icalProp participationStatus], n, [NSString stringWithFormat:@"[%d] != %@", [icalProp participationStatus], [icalProp value]]);
	}
}

@end
