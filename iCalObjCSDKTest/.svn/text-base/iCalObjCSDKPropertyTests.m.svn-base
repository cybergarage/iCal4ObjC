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

#define CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY @"TESTKEY"
#define CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_VALUE @"TESTVALUE"

- (void)testPropertyAdd
{
    CGICalendarComponent *icalComp = [[CGICalendarComponent alloc] init];
    
    STAssertTrue([[icalComp properties] count] == 0, @"");
    STAssertNil([icalComp propertyValueForName:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY], @"");
    STAssertFalse([icalComp hasPropertyForName:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY], @"");
    
    [icalComp setPropertyValue:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_VALUE forName:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY];
    STAssertTrue([[icalComp properties] count] == 1, @"");
    STAssertNotNil([icalComp propertyValueForName:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY], @"");
    STAssertTrue([[icalComp propertyValueForName:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY] isEqualToString:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_VALUE], @"");
    STAssertTrue([icalComp hasPropertyForName:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY], @"");
    
    [icalComp removePropertyForName:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY];
    STAssertTrue([[icalComp properties] count] == 0, @"");
    STAssertNil([icalComp propertyValueForName:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY], @"");
    STAssertFalse([icalComp hasPropertyForName:CG_ICALOBJCSDK_TESTS_PRPPERTY_SAMPLE01_KEY], @"");
    
    [icalComp release];
}

- (void)testPropertyParticipationStatus
{
    for (int n=CGICalendarParticipationStatusUnkown; n<=CGICalendarParticipationStatusInProcess; n++) {
        CGICalendarProperty *icalProp = [[CGICalendarProperty alloc] init];
        [icalProp setParticipationStatus:n];
        STAssertTrue([icalProp participationStatus] == n, [NSString stringWithFormat:@"[%d] != %@", [icalProp participationStatus], [icalProp value]]);
        [icalProp release];
    }
}

@end
