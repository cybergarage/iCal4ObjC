//
//  CGICalendarContentLine.h
//
//  Created by Satoshi Konno on 11/01/28.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CGICalendarProperty.h"

#define CG_ICALENDAR_CONTENTLINE_TERM @"\r\n"
#define CG_ICALENDAR_CONTENTLINE_FOLDING_SPACE @" "
#define CG_ICALENDAR_CONTENTLINE_FOLDING_TAB @"\t"
#define CG_ICALENDAR_CONTENTLINE_DELIM @":"
#define CG_ICALENDAR_CONTENTLINE_NAMEPARAM_DELIM @";"

#define CG_ICALENDAR_CONTENTLINE_NAME_BEGIN @"BEGIN"
#define CG_ICALENDAR_CONTENTLINE_NAME_END @"END"

#define CG_ICALENDAR_CONTENTLINE_CONPONENT_VCALENDAR @"VCALENDAR"
#define CG_ICALENDAR_CONTENTLINE_CONPONENT_VEVENT @"VEVENT"
#define CG_ICALENDAR_CONTENTLINE_CONPONENT_VJOURNAL @"VJOURNAL"
#define CG_ICALENDAR_CONTENTLINE_CONPONENT_VFREEBUSY @"VFREEBUSY"
#define CG_ICALENDAR_CONTENTLINE_CONPONENT_VTIMEZONE @"VTIMEZONE"

@interface CGICalendarContentLine : CGICalendarProperty {

}
+ (BOOL)IsFoldingLineString:(NSString *)aString;
+ (id)contentLineWithString:(NSString *)aString;

- (id)init;
- (id)initWithString:(NSString *)aString;
- (void)setString:(NSString *)aString;

- (NSString *)description;

- (BOOL)isBegin;
- (BOOL)isEnd;
@end
