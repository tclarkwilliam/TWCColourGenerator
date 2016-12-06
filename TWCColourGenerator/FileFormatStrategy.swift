import Foundation

protocol FileFormatStrategy {
  
  func interfaceFilePath(fileName: String,
                         outputPath: String) -> String
  func interfaceFormat(colours: Array<String>,
                       fileName: String) -> String
  func implementationFilePath(fileName: String,
                              outputPath: String) -> String
  func implementationFormat(colours: Array<String>,
                            fileName: String) -> String
  func functionName(prefix: String,
                    colourName: String) -> String
  func functionBody(red: CGFloat,
                    green: CGFloat,
                    blue: CGFloat,
                    alpha: CGFloat) -> String
}
