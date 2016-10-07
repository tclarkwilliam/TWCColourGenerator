#import "TWCFileGenerator.h"
#import "TWCLanguageAdapter.h"

@interface TWCFileGenerator ()

@property (nonatomic, strong) TWCLanguageAdapter *adapter;
@property (nonatomic, strong) NSColorList *colourList;
@property (nonatomic, copy) NSString *prefix;
@property (nonatomic, copy) NSString *outputPath;
@property (nonatomic, copy) NSString *fileName;

@end

@implementation TWCFileGenerator

- (instancetype)initWithAdapter:(TWCLanguageAdapter *)adapter
                     colourList:(NSColorList *)colourList
                         prefix:(NSString *)prefix
                     outputPath:(NSString *)outputPath
                       fileName:(NSString *)fileName
{
  self = [super init];
  if (self) {
    self.adapter = adapter;
    self.colourList = colourList;
    self.prefix = prefix;
    self.outputPath = outputPath;
    self.fileName = fileName;
  }
  return self;
}

- (NSString *)interfaceFunctionName:(NSString *)colourName
{
  return [self.adapter functionNameWithPrefix:self.prefix colourName:colourName];
}

- (NSString *)implementationFunctionWithColourName:(NSString *)colourName
{
  NSColor *colour = [self.colourList colorWithKey:colourName];
  CGFloat r, g, b, a;
  [colour getRed:&r green:&g blue:&b alpha:&a];
  NSString *functionName = [self.adapter functionNameWithPrefix:self.prefix colourName:colourName];
  NSString *functionBody = [self.adapter functionBodyWithR:r g:g b:b a:a];
  return [functionName stringByAppendingString:functionBody];
}

- (void)writeInterfaceToFileWithColourNames:(NSArray *)colourNames
{
  NSString *interface = [self.adapter interfaceFormatWithColours:colourNames fileName:self.fileName];
  NSString *file = [self.adapter interfaceFilePathWithName:self.fileName outputPath:self.outputPath];
  [interface writeToFile:file
              atomically:TRUE
                encoding:NSUTF8StringEncoding
                   error:nil];
}

- (void)writeImplementationToFileWithColours:(NSArray *)colours
{
  NSString *implementation = [self.adapter implementationFormatWithColours:colours fileName:self.fileName];
  NSString *file = [self.adapter implementationFilePathWithName:self.fileName outputPath:self.outputPath];
  [implementation writeToFile:file
                   atomically:TRUE
                     encoding:NSUTF8StringEncoding
                        error:nil];
}

@end