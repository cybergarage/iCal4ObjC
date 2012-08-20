//
//  CGICalendar.m
//
//  Created by Satoshi Konno on 11/01/28.
//  Copyright 2011 Satoshi Konno. All rights reserved.
//

#import "CGICalendar.h"
#import "CGICalendarContentLine.h"

@interface CGICalendar()
@property(retain) NSMutableArray *parserStack;
- (id)peekParserObject;
- (id)popParserObject;
- (void)pushParserObject:(id)object;
- (void)clearParserObjects;
@end

@implementation CGICalendar

@synthesize objects;
@synthesize parserStack;

#pragma mark -
#pragma mark Class Methods

+ (NSString *)UUID
{
	CFUUIDRef uuid = CFUUIDCreate(nil);
	NSString *uuidString = (NSString*)CFUUIDCreateString(nil, uuid);
	CFRelease(uuid);
	return [uuidString autorelease];    
}

#pragma mark -
#pragma mark Initialize

- (id)init
{
	if ((self = [super init])) {
        [self setObjects:[NSMutableArray array]];
 	}
	return self;
}

- (id)initWithString:(NSString *)aString
{
	if ((self = [self init])) {
		[self parseWithString:aString error:nil];
	}
	return self;
}

- (id)initWithPath:(NSString *)aPath
{
	if ((self = [self init])) {
		[self parseWithPath:aPath error:nil];
	}
	return self;
}

- (void)dealloc
{
	[parserStack release];
	[objects release];
	[super dealloc];
}

#pragma mark -
#pragma mark Object

- (void)addObject:(CGICalendarObject *)object
{
    [[self objects] addObject:object];
}

- (CGICalendarObject *)objectAtIndex:(NSUInteger)index
{
    return [[self objects] objectAtIndex:index];
}

#pragma mark -
#pragma mark Parser

- (NSError *)createErrorAt:(NSUInteger)lineNumber lineString:(NSString *)lineString
{
    return [NSError errorWithDomain:@"iCalForObjC" code:-1 userInfo:
            [NSDictionary dictionaryWithObjectsAndKeys:
             [NSString stringWithFormat:@"%d", lineNumber], @"LineNumber",
             lineString, @"ContentLine",
             nil]];
}

- (BOOL)parseWithString:(NSString *)aString error:(NSError **)error
{
    [self setObjects:[NSMutableArray array]];
    [self clearParserObjects];
    
	if (aString == nil)
		return NO;
    
	NSArray *foldingContentLines = [aString componentsSeparatedByString:CG_ICALENDAR_CONTENTLINE_TERM];
    NSMutableArray *contentLines = [NSMutableArray array];
	for (NSString *foldingContentLine in foldingContentLines) {
        if (foldingContentLine == nil)
            continue;
        if ([CGICalendarContentLine IsFoldingLineString:foldingContentLine] == NO) {
            [contentLines addObject:[NSMutableString stringWithString:foldingContentLine]];
            continue;
        }
        NSMutableString *lastLineString = [contentLines lastObject];
        if (lastLineString == nil)
            continue;
        [lastLineString appendString:[foldingContentLine substringWithRange:NSMakeRange(1, ([foldingContentLine length] - 1))]];
    }
    
    int contentLineNumber = 0;
	for (NSString *contentLine in contentLines) {
        contentLineNumber++;
        
		CGICalendarContentLine *icalContentLine = [[CGICalendarContentLine alloc] initWithString:contentLine];
        CGICalendarComponent *icalParentComponent = [self peekParserObject];
                
        // BEGIN
        if ([icalContentLine isBegin]) {
            CGICalendarComponent *icalComponent;
            if (icalParentComponent == nil) {
                icalComponent = [[CGICalendarObject alloc] init];
                [self addObject:(CGICalendarObject *)icalComponent];
            }
            else {
                icalComponent = [[CGICalendarComponent alloc] init];
                [icalParentComponent addComponent:icalComponent];
            }
            [icalComponent setType:[icalContentLine value]];
            [self pushParserObject:icalComponent];
            [icalComponent release];
            [icalContentLine release];
            continue;
        }
        
        // END
        if ([icalContentLine isEnd]) {
            [self popParserObject];
            [icalContentLine release];
            continue;
        }

        NSString *propertyName = [icalContentLine name];
        CGICalendarProperty *icalProperty = [icalParentComponent propertyForName:propertyName];
        if (icalProperty == nil) {
            icalProperty = [[[CGICalendarProperty alloc] init] autorelease];
            [icalProperty setName:propertyName];
            [icalParentComponent addProperty:icalProperty];
        }
        [icalProperty setValue:[icalContentLine value]];
        for (CGICalendarParameter *icalParameter in [icalContentLine parameters])
            [icalProperty setParameterValue:[icalParameter value] forName:[icalParameter name]];
        
		[icalContentLine release];
	}
	
    return YES;
}

- (BOOL)parseWithPath:(NSString *)path  error:(NSError **)error
{
	NSData *fileData = [NSData dataWithContentsOfFile:path];
	if (fileData == nil)
		return NO;
    return [self parseWithString:[[[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding] autorelease] error:error];
}

#pragma mark -
#pragma mark Parser Stack Methods

- (id)peekParserObject
{
    return [[self parserStack] lastObject];
}

- (id)popParserObject
{
	id lastObject = [[self parserStack] lastObject];
    [[self parserStack] removeLastObject];
	return [[lastObject retain] autorelease];
}

- (void)pushParserObject:(id)object
{
    [[self parserStack] addObject:object];
}

- (void)clearParserObjects
{
	if( [self parserStack] ) {
		[[self parserStack] removeAllObjects];
	}
	else {
		[self setParserStack:[NSMutableArray array]];
	}
}

#pragma mark -
#pragma mark String

- (NSString *)description
{
    NSMutableString *descrString = [NSMutableString string];
    
    for (CGICalendarObject *icalObj in [self objects])
        [descrString appendString:[icalObj description]];
    
    return descrString;
}

#pragma mark -
#pragma mark File

- (BOOL)writeToFile:(NSString *)path
{
    NSString *desc = [self description];
    if (desc == nil)
        return NO;
    
    NSData *data = [desc dataUsingEncoding:NSUTF8StringEncoding];
    if (data == nil)
        return NO;

    return [data writeToFile:path atomically:YES];
}

@end
