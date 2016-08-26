#import "TWCConsoleParser.h"

@import Foundation;

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    [TWCConsoleParser startWithArgc:argc
                               argv:argv];
  }
}