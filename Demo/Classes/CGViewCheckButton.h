//
//  CGViewCheckButton.h
//  iCalToDo
//
//  Created by Satoshi Konno on 11/05/18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGICalendar.h"

@interface CGViewCheckButton : UIButton

@property (strong) CGICalendarComponent *todoComponent;

- (id)initWithTodoComponent:(CGICalendarComponent *)todoComp;

@end
