@import Foundation;

@interface TWCConsoleParser : NSObject

+ (void)startWithArgc:(int)argc
                 argv:(const char **)argv;

@end