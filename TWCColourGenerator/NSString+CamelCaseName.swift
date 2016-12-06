import Foundation

extension NSString {
  
  class func camelCaseName(colourName: String) -> String {
    let mutableColourName: NSMutableString = colourName.mutableCopy() as! NSMutableString
    let firstCharacter = colourName.index(colourName.startIndex, offsetBy: 1)
    let lowerCaseFirstCharacter = colourName.substring(to: firstCharacter).lowercased()
    let range = NSRange(location: 0, length: 1)
    mutableColourName.replaceCharacters(in: range,
                                        with: lowerCaseFirstCharacter)
    return mutableColourName.replacingOccurrences(of: " ", with: "")
  }
  
}
