//
//  CGICalTodoViewCheckButton.m
//  iCalToDo
//
//  Created by Satoshi Konno on 11/05/18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CGICalTodoViewController.h"
#import "CGICalTodoViewCheckButton.h"

@implementation CGICalTodoViewCheckButton

@synthesize todoComponent;

- (id)initWithTodoComponent:(CGICalendarComponent *)todoComp
{
	if ((self = [super initWithFrame:CGRectMake(0.0, 0.0, CG_ICALTODOVIRECONTROLLER_CHECKED_IMAGE_SIZE, CG_ICALTODOVIRECONTROLLER_CHECKED_IMAGE_SIZE)])) {
        [self setTodoComponent:todoComp];
    }
    return self;
}

@end
