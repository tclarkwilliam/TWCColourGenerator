#import "TWCConsoleParser.h"

@import Foundation;

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    TWCConsoleParser *parser = [TWCConsoleParser new];
    [parser startWithArgc:argc
                     argv:argv];
  }
}