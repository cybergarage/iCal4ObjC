//
//  CGDetailViewController.h
//  iCalToDo
//
//  Created by Satoshi Konno on 11/05/16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGICalendar.h"

@class CGDetailViewController;

@protocol CGDetailViewControllerDelegate <NSObject>

@required
- (void)icalTodoDetailViewController:(CGDetailViewController *)icalTodoDetailViewController didFinished:(CGICalendarComponent *)todo;
- (void)icalTodoDetailViewController:(CGDetailViewController *)icalTodoDetailViewController didCanceled:(CGICalendarComponent *)todo;

@end

@interface CGDetailViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong) CGICalendarComponent *todo;
@property (strong) id<CGDetailViewControllerDelegate> delegate;
@property (strong) UITextField *summaryField;
@property (strong) UITextView *descField;
@property (assign, getter = isModalMode) BOOL modalMode;

- (id)initWithTodo:(CGICalendarComponent *)aTodo;

@end
