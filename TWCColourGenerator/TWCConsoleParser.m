#import "TWCConsoleParser.h"
#import "TWCColourGenerator.h"
#import "TWCLanguage.h"
#import "TWCFileFormatSwift.h"
#import "TWCFileFormatObjectiveC.h"

@interface TWCConsoleParser ()

@property (nonatomic, copy) NSString *inputPath;
@property (nonatomic, copy) NSString *outputPath;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *prefix;
@property (nonatomic, copy) NSString *language;

@end

@implementation TWCConsoleParser

- (void)startWithArgc:(int)argc
                 argv:(const char **)argv
{
  NSArray *options = [[NSProcessInfo processInfo] arguments];
  char opt;
  while ((opt = getopt(argc, (char *const*)argv, "i:o:n:l:p:h")) != -1) {
    switch (opt) {
      case 'h': {
        printf("\nUsage:\n");
        printf("  ./TWCColourGenerator -i <~/path> -o <~/path> -n <name> -l <language>\n");
        printf("Options:\n");
        printf("  -i <~/path> Path to and including .clr file (Required)\n");
        printf("  -o <~/path> Path to dump file               (Required)\n");
        printf("  -n <name> Extension name                    (Required)\n");
        printf("  -l <language (objc / swift)> Language       (Required)\n");
        printf("  -p <prefix> Prefix for colour name function (Optional)\n\n");
        break;
      }
      case 'i': {
        self.inputPath = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      case 'o': {
        self.outputPath = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      case 'n': {
        self.fileName = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      case 'l': {
        self.language = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      case 'p': {
        self.prefix = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      default:
        break;
    }
  }
  if (![options containsObject:@"-h"]) {
    [self checkValidArgs];
  }
}

- (void)checkValidArgs
{
  if ([self validArgs]) {
    [self createGenerator];
  } else {
    NSLog(@"Incorrect argument specified.");
    exit(0);
  }
}

- (BOOL)validArgs
{
  return self.inputPath &&
         self.outputPath &&
         self.fileName &&
         [self lang];
}

- (void)createGenerator
{
  TWCColourGenerator *generator = [[TWCColourGenerator alloc] initWithWithInputPath:self.inputPath
                                                                         outputPath:self.outputPath
                                                                           fileName:self.fileName
                                                                             prefix:self.prefix
                                                                           language:[self lang]];
  [generator generateColours];
}

- (id<TWCLanguage>)lang
{
  id<TWCLanguage> lang = nil;
  if ([self.language isEqualToString:@"swift"]) {
    lang = [TWCFileFormatSwift new];
  } else if ([self.language isEqualToString:@"objc"]) {
    lang = [TWCFileFormatObjectiveC new];
  }
  return lang;
}

@end