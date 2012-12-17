//
//  iCalObjCSDKTests.m
//  iCalObjCSDKTests
//
//  Created by Satoshi Konno on 11/04/08.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "iCalObjCSDKTests.h"
#import "CGICalendar.h"

@implementation iCalObjCSDKTests(Component)

- (void)testTodoComponent {
	CGICalendarComponent *icalTodo = [CGICalendarComponent todo];
	STAssertTrue([icalTodo isTodo], @"");
}

@end
