import Cocoa

class ColourGenerator {
  
  var inputPath: String!
  var outputPath: String!
  var fileName: String!
  var prefix: String!
  var fileFormatStrategy: FileFormatStrategy!
  
  init(inputPath: String,
       outputPath: String,
       fileName: String,
       prefix: String,
       fileFormatStrategy: FileFormatStrategy) {
    self.inputPath = inputPath
    self.outputPath = outputPath
    self.fileName = fileName
    self.prefix = prefix
    self.fileFormatStrategy = fileFormatStrategy
  }
  
  func generateColours() {
    var colours = [String]()
    var colourNames = [String]()
    if let colourList = self.colourList() {
      for colourName in colourList.allKeys {
        colourNames.append(self.fileGenerator().interfaceFunctionName(colourName: colourName.rawValue))
        colours.append(self.fileGenerator().implementationFunction(colourName: colourName.rawValue))
      }
      self.fileGenerator().writeInterfaceToFile(colourNames: colourNames)
      self.fileGenerator().writeImplementationToFile(colours: colours)
    }
  }
  
  private func colourList() -> NSColorList? {
    let colourPalettePathURL = NSURL(string: self.inputPath)
    let colourPaletteName = colourPalettePathURL?.lastPathComponent
    var colourList: NSColorList?
    if let colourPaletteName = colourPaletteName {
      colourList = NSColorList(name: NSColorList.Name(rawValue: colourPaletteName),
                               fromFile: colourPalettePathURL?.relativeString)
    }
    return colourList
  }
  
  private func fileGenerator() -> FileGenerator {
    return FileGenerator(fileFormat: self.fileFormat(),
                         colourList: self.colourList()!,
                         prefix: self.prefix,
                         outputPath: self.outputPath,
                         fileName: self.fileName)
  }
  
  private func fileFormat() -> FileFormat {
    return FileFormat(fileFormatStrategy: self.fileFormatStrategy)
  }
  
}
