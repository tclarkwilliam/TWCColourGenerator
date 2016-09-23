#import "TWCConsoleParser.h"
#import "TWCColourGenerator.h"

@implementation TWCConsoleParser

+ (void)startWithArgc:(int)argc
                 argv:(const char **)argv
{
  NSString *inputPath = @"";
  NSString *outputPath = @"";
  NSString *fileName = @"";
  NSString *prefix = @"";
  char opt;
  while ((opt = getopt(argc, (char *const*)argv, "i:o:n:p:h")) != -1) {
    switch (opt) {
      case 'h': {
        printf("\nUsage:\n");
        printf("  ./TWCColourGenerator -i <input path> -o <output path> -n <name>\n");
        printf("Options:\n");
        printf("  -i <input path> Path to and including .clr file (Required)\n");
        printf("  -o <output path> Path to dump file              (Required)\n");
        printf("  -n <name> Extension name                        (Required)\n");
        printf("  -p <prefix> Prefix for colour name function     (Optional)\n\n");
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
      case 'p': {
        prefix = [[NSString alloc] initWithUTF8String:optarg];
        break;
      }
      default:
        break;
    }
  }
  [TWCColourGenerator generateColourListWithInputPath:inputPath
                                           outputPath:outputPath
                                             fileName:fileName
                                               prefix:prefix];
}

@end