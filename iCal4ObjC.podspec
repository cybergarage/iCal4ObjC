
Pod::Spec.new do |s|
s.name         = "iCal4ObjC"
s.version      = "1.1.0"
s.summary      = "iCal4ObjC is a simple Objective-C framework for iCalendar specification"
s.description  = <<-DESC
iCal4ObjC is a Objective-C implementation of the iCalendar specification as defined in RFC2455 for iOS and MacOSX platforms such as iPhone and iPad. It supports to read or write the components of iCalendar in the stream easily. For more the information, please check http://www.cybergarage.org/doxygen/ical4objc/ - the doxygen documentation.
DESC
s.homepage     = "https://github.com/Good-Technology-OS/iCal4ObjC"
s.license      = "Limited Liability"
s.author       = { "Satoshi Konno" => "skonno@cybergarage.org" }
s.platform     = :ios, "5.0"
s.source       = { :git => "https://github.com/Good-Technology-OS/iCal4ObjC.git", :tag => "1.1.0" }
s.source_files  = "iCalObjCSDK"
s.public_header_files = "iCalObjCSDK/*.h"
s.frameworks = "Foundation", "AnotherFramework"
s.requires_arc = true
end
