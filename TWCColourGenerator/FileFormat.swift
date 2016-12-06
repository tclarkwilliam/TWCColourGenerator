import Foundation

class FileFormat {
  
  var fileFormatStrategy: FileFormatStrategy
  
  init(fileFormatStrategy: FileFormatStrategy) {
    self.fileFormatStrategy = fileFormatStrategy
  }
  
  func interfaceFilePath(fileName: String,
                         outputPath: String) -> String {
    return self.fileFormatStrategy.interfaceFilePath(fileName: fileName,
                                                     outputPath: outputPath)
  }
  
  func interfaceFormat(colours: Array<String>,
                       fileName: String) -> String {
    return self.fileFormatStrategy.interfaceFormat(colours: colours,
                                                   fileName: fileName)
  }
  
  func implementationFilePath(fileName: String,
                              outputPath: String) -> String {
    return self.fileFormatStrategy.implementationFilePath(fileName: fileName,
                                                          outputPath: outputPath)
  }
  
  func implementationFormat(colours: Array<String>,
                            fileName: String) -> String {
    return self.fileFormatStrategy.implementationFormat(colours: colours,
                                                        fileName: fileName)
  }
  
  func functionName(prefix: String,
                    colourName: String) -> String {
    return self.fileFormatStrategy.functionName(prefix: prefix,
                                                colourName: colourName)
  }
  
  func functionBody(red: CGFloat,
                    green: CGFloat,
                    blue: CGFloat,
                    alpha: CGFloat) -> String {
    return self.fileFormatStrategy.functionBody(red: red,
                                                green: green,
                                                blue: blue,
                                                alpha: alpha)
  }
  
}
