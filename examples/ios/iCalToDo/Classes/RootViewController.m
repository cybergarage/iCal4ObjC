//
//  RootViewController.m
//  iCalToDo
//
//  Created by Satoshi Konno on 11/01/27.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "RootViewController.h"
#import "CGICalendar.h"

@implementation RootViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitle:[[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleName"]];

    NSString *icalPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:CG_ICALTODO_LOCAL_FILENAME];
    [self setPath:icalPath];
}

@end

