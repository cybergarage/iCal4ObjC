//
//  CGTableViewController.h
//  iCalToDo
//
//  Created by Satoshi Konno on 5/14/11.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGDetailViewController.h"

extern NSString * const CGTableViewControllerTitle;
extern NSUInteger const CGTableViewControllerCheckedImageSize;
extern NSUInteger const CGTableViewControllerImageOffset;
extern NSString * const CGTableViewControllerImageCheckedNone;
extern NSString * const CGTableViewControllerImageCheckedDone;

@interface CGTableViewController : UITableViewController <CGDetailViewControllerDelegate>

- (id)initWithPath:(NSString *)path;
- (void)setPath:(NSString *)path;

@end
