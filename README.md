# iCal for ObjC

## Introduction

iCal4ObjC is a Objective-C implementation of the iCalendar specification as defined in [RFC2455](http://tools.ietf.org/html/rfc2445) for iOS and MacOSX platforms such as iPhone and iPad. It supports to read or write the components of iCalendar in the stream easily. For more the information, please check [the doxygen documentation](http://www.cybergarage.org:8080/doxygen/ical4objc/).

## Installation

### Getting SDK Package

1\. Get the SDK package from the following site.

- [GitHub](https://github.com/cybergarage/iCal4ObjC)

2\. Adding iCalObjCSDK to your project

To use iCalForObj4 on your XCode project, you have to add the following files in [iCalObjCSDK](https://github.com/cybergarage/iCal4ObjC/tree/master/iCalObjCSDK) subfolder of the SDK package.

```
CGICalendar.h
CGICalendar.m
CGICalendarComponent.h
CGICalendarComponent.m
CGICalendarContentLine.h
CGICalendarContentLine.m
CGICalendarObject.h
CGICalendarObject.m
CGICalendarParameter.h
CGICalendarParameter.m
CGICalendarProperty.h
CGICalendarProperty.m
CGICalendarValue.h
CGICalendarValue.m
NSDate+CGICalendar.h
NSDate+CGICalendar.m
```

## Usage

### Parsing iCalendar objects

To parse an existing iCalendar stream or string use CGICalendar::parse as the following.

```
#import "CGICalendar.h"

CGICalendar *ical = [[CGICalendar alloc] init];
if ([ical parseWithPath:icalPath error:nil]) {
    ..........
}
```

To traverse the all objects, components, properties and parameters in a
iCalendar, use CGICalendar::objects, CGICalendarObject::components,
CGICalendarComponent::properties and CGICalendarProperty:: parameters as
the following.

```
for (CGICalendarObject *icalObj in [self objects]) {
    for (CGICalendarComponent *icalComp in [icalObj components]) {
        NSString *icalCompType = [icalComp type];
        ..........
        for (CGICalendarProperty *icalProp in [icalComp properties]) {
            NSString *icalPropName = [icalProp name];
            NSString *icalPropValue = [icalProp value];
            ..........
            for (CGICalendarParameter *icalParam in [icalProp parameters]) {
                NSString *icalParamName = [icalProp name];
                NSString *icalPropValue = [icalProp value];
                ..........
            }
        }
    }
}
```

### Adding objects, components or properties

To add your objects, components and properties into a iCalendar instance, use CGICalendar::addObject:, CGICalendarObject::addComponent: and CGICalendarComponent::addProperty: as the following.

```
CGICalendar *ical = [[CGICalendar alloc] init];

// Add a object
CGICalendarObject *icalObj = [[[CGICalendarObject alloc] initWithProdid:@"//CyberGarage//iCal4ObjC//EN"] autorelease];
[ical addObject:icalObj];

// Add a component
CGICalendarComponent *icalComp = [[[CGICalendarComponent alloc] initWithType:@"VTODO"] autorelease];
[icalObj addComponent:icalComp];

// Add a property
CGICalendarProperty *icalProp = [[[CGICalendarProperty alloc] init] autorelease];
[icalProp setName:@"SUMMARY"];
[icalProp setValue:@"Write report"];
[icalComp addComponent:icalProp];
```

### Writing iCalendar objects

To export a iCalendar object into a file, use CGICalendar:writeToFile as the following.

```
CGICalendar *ical = ..........
.........
[ical writeToFile:@"MyToDo.ics"];
```

## Resources

### Repositories

Please see the following project page on GitHub to get the source codes with the examples :-)

- [GitHub](https://github.com/cybergarage/iCal4ObjC)
- [Doxygen](http://www.cybergarage.org:8080/doxygen/ical4objc/)
