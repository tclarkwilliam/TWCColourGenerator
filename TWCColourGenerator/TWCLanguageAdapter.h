#import "TWCLanguage.h"

@interface TWCLanguageAdapter : NSObject

- (instancetype)initWithLanguage:(id<TWCLanguage>)language;
- (NSString *)interfaceFilePathWithName:(NSString *)fileName outputPath:(NSString *)outputPath;
- (NSString *)interfaceFormatWithColours:(NSArray *)colours fileName:(NSString *)fileName;
- (NSString *)implementationFilePathWithName:(NSString *)fileName outputPath:(NSString *)outputPath;
- (NSString *)implementationFormatWithColours:(NSArray *)colours fileName:(NSString *)fileName;
- (NSString *)functionNameWithPrefix:(NSString *)prefix colourName:(NSString *)colourName;
- (NSString *)functionBodyWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;

@end