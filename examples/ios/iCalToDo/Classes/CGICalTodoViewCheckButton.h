//
//  CGICalTodoViewCheckButton.h
//  iCalToDo
//
//  Created by Satoshi Konno on 11/05/18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGICalendar.h"

@interface CGICalTodoViewCheckButton : UIButton {
    
}
@property(retain) CGICalendarComponent *todoComponent;
- (id)initWithTodoComponent:(CGICalendarComponent *)todoComp;
@end
