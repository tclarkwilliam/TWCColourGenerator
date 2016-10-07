#import "TWCFileFormat.h"

@implementation TWCFileFormat

- (NSString *)camelCaseColourName:(NSString *)colourName
{
  NSMutableString *mutableColourName = [colourName mutableCopy];
  NSString *lowerCaseFirstLetter = [[colourName substringToIndex:1] lowercaseString];
  [mutableColourName replaceCharactersInRange:NSMakeRange(0, 1) withString:lowerCaseFirstLetter];
  return [mutableColourName stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end