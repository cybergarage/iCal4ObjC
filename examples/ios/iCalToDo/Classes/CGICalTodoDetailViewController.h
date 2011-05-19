//
//  CGICalTodoDetailViewController.h
//  iCalToDo
//
//  Created by Satoshi Konno on 11/05/16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGICalendar.h"

@class CGICalTodoDetailViewController;

@protocol CGICalTodoDetailViewControllerDelegate <NSObject>
@required
- (void)icalTodoDetailViewController:(CGICalTodoDetailViewController *)icalTodoDetailViewController didFinished:(CGICalendarComponent *)todo;
- (void)icalTodoDetailViewController:(CGICalTodoDetailViewController *)icalTodoDetailViewController didCanceled:(CGICalendarComponent *)todo;
@end
@interface CGICalTodoDetailViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate> {
    
}
@property(retain) CGICalendarComponent *todo;
@property(retain) id<CGICalTodoDetailViewControllerDelegate> delegate;
@property(retain) UITextField *summaryField;
@property(retain) UITextView *descField;
@property(assign, getter = isModalMode) BOOL modalMode;

- (id)initWithTodo:(CGICalendarComponent *)aTodo;

@end
