//
//  CGICalendar.h
//
//  Created by Satoshi Konno on 11/01/28.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CGICalendarObject.h"
#import "NSDate+CGICalendar.h"
#import "CGICalendarComponent.h"
#import "CGICalendarProperty.h"

#define CG_ICALENDAR_HEADER_CONTENTLINE @"BEGIN:VCALENDAR"
#define CG_ICALENDAR_FOOTER_CONTENTLINE @"END:VCALENDAR"

@interface CGICalendar : NSObject {

}
@property(strong) NSMutableArray *objects;

+ (NSString *)UUID;

- (id)init;
- (id)initWithString:(NSString *)string;
- (id)initWithPath:(NSString *)path;

- (BOOL)parseWithString:(NSString *)string  error:(NSError **)error;
- (BOOL)parseWithPath:(NSString *)path  error:(NSError **)error;

- (void)addObject:(CGICalendarObject *)object;
- (CGICalendarObject *)objectAtIndex:(NSUInteger)index;

- (NSString *)description;
+ (NSString *)unescape:(NSString *)aValue;

- (BOOL)writeToFile:(NSString *)path;

@end
