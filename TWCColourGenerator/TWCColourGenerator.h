@import Foundation;
@import Cocoa;

@interface TWCColourGenerator : NSObject

+ (void)generateColourListWithInputPath:(NSString *)inputPath
                             outputPath:(NSString *)outputPath
                               fileName:(NSString *)fileName
                                 prefix:(NSString *)prefix;

@end