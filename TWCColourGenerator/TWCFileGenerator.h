#import "TWCLanguage.h"

@import Cocoa;

@class TWCLanguageAdapter;

@interface TWCFileGenerator : NSObject

- (instancetype)initWithAdapter:(TWCLanguageAdapter *)adapter
                     colourList:(NSColorList *)colourList
                         prefix:(NSString *)prefix
                     outputPath:(NSString *)outputPath
                       fileName:(NSString *)fileName;
- (NSString *)interfaceFunctionName:(NSString *)colourName;
- (NSString *)implementationFunctionWithColourName:(NSString *)colourName;
- (void)writeInterfaceToFileWithColourNames:(NSArray *)colourNames;
- (void)writeImplementationToFileWithColours:(NSArray *)colours;

@end