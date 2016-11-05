#import "TWCConsoleParser.h"
#import "TWCColourGenerator.h"
#import "TWCLanguage.h"
#import "TWCFileFormatSwift.h"
#import "TWCFileFormatObjectiveC.h"

@implementation TWCConsoleParser

+ (void)startWithArgc:(int)argc
                 argv:(const char **)argv
{
  NSString *inputPath = @"";
  NSString *outputPath = @"";
  NSString *fileName = @"";
  NSString *prefix = @"";
  NSString *language = @"";
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
        inputPath = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      case 'o': {
        outputPath = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      case 'n': {
        fileName = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      case 'l': {
        language = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      case 'p': {
        prefix = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      default:
        break;
    }
  }
  if (![options containsObject:@"-h"]) {
    id<TWCLanguage> lang = nil;
    if ([language isEqualToString:@"swift"]) {
      lang = [TWCFileFormatSwift new];
    } else if ([language isEqualToString:@"objc"]) {
      lang = [TWCFileFormatObjectiveC new];
    }
    TWCColourGenerator *generator = [[TWCColourGenerator alloc] initWithWithInputPath:inputPath 
                                                                           outputPath:outputPath
                                                                             fileName:fileName
                                                                               prefix:prefix
                                                                             language:lang];
    [generator generateColours];
  }
}

@end