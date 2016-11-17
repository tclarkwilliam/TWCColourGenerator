#import "TWCLanguageAdapter.h"

@interface TWCLanguageAdapter ()

@property (nonatomic, strong) id<TWCLanguage> language;

@end

@implementation TWCLanguageAdapter

- (instancetype)initWithLanguage:(id<TWCLanguage>)language
{
  self = [super init];
  if (self) {
    self.language = language;
  }
  return self;
}

- (NSString *)interfaceFilePathWithName:(NSString *)fileName outputPath:(NSString *)outputPath
{
  return [self.language interfaceFilePathWithName:fileName outputPath:outputPath];
}

- (NSString *)interfaceFormatWithColours:(NSArray *)colours fileName:(NSString *)fileName
{
  return [self.language interfaceFormatWithColours:colours fileName:fileName];
}

- (NSString *)implementationFilePathWithName:(NSString *)fileName outputPath:(NSString *)outputPath
{
  return [self.language implementationFilePathWithName:fileName outputPath:outputPath];
}

- (NSString *)implementationFormatWithColours:(NSArray *)colours fileName:(NSString *)fileName
{
  return [self.language implementationFormatWithColours:colours fileName:fileName];
}

- (NSString *)functionNameWithPrefix:(NSString *)prefix colourName:(NSString *)colourName
{
  return [self.language functionNameWithPrefix:prefix colourName:colourName];
}

- (NSString *)functionBodyWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a
{
  return [self.language functionBodyWithR:r g:g b:b a:a];
}

@end