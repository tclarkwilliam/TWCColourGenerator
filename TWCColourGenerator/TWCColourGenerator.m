#import "TWCColourGenerator.h"
#import "TWCFileGenerator.h"
#import "TWCLanguageAdapter.h"

@interface TWCColourGenerator ()

@property (nonatomic, copy) NSString *inputPath;
@property (nonatomic, copy) NSString *outputPath;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *prefix;
@property (nonatomic, weak) id<TWCLanguage> language;

@end

@implementation TWCColourGenerator

- (instancetype)initWithWithInputPath:(NSString *)inputPath
                           outputPath:(NSString *)outputPath
                             fileName:(NSString *)fileName
                               prefix:(NSString *)prefix
                             language:(id<TWCLanguage>)language
{
  self = [super init];
  if (self) {
    self.inputPath = inputPath;
    self.outputPath = outputPath;
    self.fileName = fileName;
    self.prefix = prefix;
    self.language = language;
  }
  return self;
}

- (void)generateColours
{
  [self checkValidLanguage];
  NSMutableArray *colours = [NSMutableArray array];
  NSMutableArray *colourNames = [NSMutableArray array];
  for (NSString *colourName in [[self colourList] allKeys]) {
    [colourNames addObject:[[self fileGenerator] interfaceFunctionName:colourName]];
    [colours addObject:[[self fileGenerator] implementationFunctionWithColourName:colourName]];
  }
  [self.fileGenerator writeInterfaceToFileWithColourNames:colourNames];
  [self.fileGenerator writeImplementationToFileWithColours:colours];
}

- (NSColorList *)colourList
{
  NSURL *colourPalletePathUrl = [NSURL URLWithString:self.inputPath];
  NSString *colourPalleteName = [colourPalletePathUrl.lastPathComponent stringByDeletingPathExtension];
  NSString *expandedInputPath = [colourPalletePathUrl.relativeString stringByExpandingTildeInPath];
  return [[NSColorList alloc] initWithName:colourPalleteName
                                  fromFile:expandedInputPath];
}

- (TWCFileGenerator *)fileGenerator
{
  return [[TWCFileGenerator alloc] initWithAdapter:[self adapter]
                                        colourList:[self colourList]
                                            prefix:self.prefix
                                        outputPath:self.outputPath
                                          fileName:self.fileName];
}

- (TWCLanguageAdapter *)adapter
{
  return [[TWCLanguageAdapter alloc] initWithLanguage:self.language];
}

- (void)checkValidLanguage
{
  if (!self.language) {
    NSLog(@"Incorrect language specified. Must be swift or objc.");
    exit(0);
  }
}

@end