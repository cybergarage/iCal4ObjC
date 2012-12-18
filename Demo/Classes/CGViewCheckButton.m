//
//  CGViewCheckButton.m
//  iCalToDo
//
//  Created by Satoshi Konno on 11/05/18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CGTableViewController.h"
#import "CGViewCheckButton.h"

@implementation CGViewCheckButton

@synthesize todoComponent;

- (id)initWithTodoComponent:(CGICalendarComponent *)todoComp {
	if ((self = [super initWithFrame:CGRectMake(0.0, 0.0, CGTableViewControllerCheckedImageSize, CGTableViewControllerCheckedImageSize)])) {
		[self setTodoComponent:todoComp];
	}
	return self;
}

@end
