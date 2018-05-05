import Cocoa

class FileGenerator {
  
  var fileFormat: FileFormat
  var colourList: NSColorList
  var prefix: String
  var outputPath: String
  var fileName: String
  
  init(fileFormat: FileFormat,
       colourList: NSColorList,
       prefix: String,
       outputPath: String,
       fileName: String) {
    self.fileFormat = fileFormat
    self.colourList = colourList
    self.prefix = prefix
    self.outputPath = outputPath
    self.fileName = fileName
  }
  
  func interfaceFunctionName(colourName: String) -> String {
    return self.fileFormat.functionName(prefix: self.prefix,
                                        colourName: colourName)
  }
  
  func implementationFunction(colourName: String) -> String {
    let colour: NSColor = self.colourList.color(withKey: NSColor.Name(rawValue: colourName))!
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    colour.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    let functionName = self.fileFormat.functionName(prefix: self.prefix,
                                                    colourName: colourName)
    let functionBody = self.fileFormat.functionBody(red: red,
                                                    green: green,
                                                    blue: blue,
                                                    alpha: alpha)
    return functionName.appending(functionBody)
  }
  
  func writeInterfaceToFile(colourNames: Array<String>) {
    let interface = self.fileFormat.interfaceFormat(colours: colourNames,
                                                    fileName: self.fileName)
    let file = self.fileFormat.interfaceFilePath(fileName: self.fileName,
                                                 outputPath: self.outputPath)
    do {
      try interface.write(toFile: file,
                          atomically: true,
                          encoding: String.Encoding.utf8)
    } catch {}
  }
  
  func writeImplementationToFile(colours: Array<String>) {
    let implementation = self.fileFormat.implementationFormat(colours: colours,
                                                              fileName: self.fileName)
    let file = self.fileFormat.implementationFilePath(fileName: self.fileName,
                                                      outputPath: self.outputPath)
    do {
      try implementation.write(toFile: file,
                               atomically: true,
                               encoding: String.Encoding.utf8)
    } catch {}
    
  }
  
}
