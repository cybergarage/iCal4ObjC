**iCal4ObjC** is a **Objective-C** implementation of the **iCalendar specification** as defined in [RFC2455](http://tools.ietf.org/html/rfc2445) for **iOS** and **OS X**.

### Parsing iCalendar objects

    #import "CGICalendar.h"
    	
    CGICalendar *ical = [[CGICalendar alloc] init];
    if ([ical parseWithPath:icalPath error:nil]) {
    	// your logic here
    }

### Traversing iCalendar objects

To traverse the all objects, components, properties and parameters in a iCalendar, use the following:


    for (CGICalendarObject *icalObj in self.objects) {
        for (CGICalendarComponent *icalComp in icalObj.components) {
            NSString *icalCompType = icalComp.type;
            // your logic here
            for (CGICalendarProperty *icalProp in icalComp.properties) {
                NSString *icalPropName = icalProp.name;
                NSString *icalPropValue = icalProp.value;
                // your logic here
                for (CGICalendarParameter *icalParam in icalProp.parameters) {
                	// your logic here
                    NSString *icalParamName = icalProp.name;
                    NSString *icalPropValue = icalProp.value;
                }
            }
        }
    }

### Adding objects, components or properties

To add your objects, components and properties into a iCalendar instance, use the following:

    CGICalendar *ical = [[CGICalendar alloc] init];

    // Add a object
    CGICalendarObject *icalObj = [[CGICalendarObject alloc] initWithProdid:@"//CyberGarage//iCal4ObjC//EN"];
    [ical addObject:icalObj];

    // Add a component
    CGICalendarComponent *icalComp = [[CGICalendarComponent alloc] initWithType:@"VTODO"];
    [icalObj addComponent:icalComp];

    // Add a property
    CGICalendarProperty *icalProp = [[CGICalendarProperty alloc] init];
    [icalProp setName:@"SUMMARY"];
    [icalProp setValue:@"Write report"];
    [icalComp addComponent:icalProp];

### Writing iCalendar objects

To export a iCalendar object into a file, use the following:

    CGICalendar *ical = …;
    [ical writeToFile:@"MyToDo.ics"];