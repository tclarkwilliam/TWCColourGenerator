#import "TWCLanguage.h"

@interface TWCColourGenerator : NSObject

- (instancetype)initWithWithInputPath:(NSString *)inputPath
                           outputPath:(NSString *)outputPath
                             fileName:(NSString *)fileName
                               prefix:(NSString *)prefix
                             language:(id<TWCLanguage>)language;
- (void)generateColours;

@end