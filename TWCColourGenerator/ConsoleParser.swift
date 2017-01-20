import Foundation

class ConsoleParser {
  
  var count = 0
  var inputPath = ""
  var outputPath = ""
  var fileName = ""
  var prefix = ""
  var language = ""
  
  func start() {
    let arguments = CommandLine.arguments
    for option in arguments {
      self.count += 1
      switch option {
      case "-h":
        print("\nUsage:");
        print("  ./TWCColourGenerator -i <~/path> -o <~/path> -n <name> -l <language>")
        print("Options:")
        print("  -i <~/path> Path to and including .clr file (Required)")
        print("  -o <~/path> Path to dump file               (Required)")
        print("  -n <name> Extension name                    (Required)")
        print("  -p <prefix> Prefix for colour name function (Optional)\n")
        print("  -l <language (objc / swift)> Language       (Required)")
      case "-i":
        self.inputPath = arguments[self.count]
      case "-o":
        self.outputPath = arguments[self.count]
      case "-n":
        self.fileName = arguments[self.count]
      case "-p":
        self.prefix = arguments[self.count]
      case "-l":
        self.language = arguments[self.count]
      default:
        break
      }
    }
    self.checkValidArguments()
  }
  
  private func checkValidArguments() {
    for argument in self.requiredArguments() {
      if argument.characters.count == 0 || self.fileFormat() == nil {
        print("Incorrect argument specified")
        exit(0)
      } else {
        self.createGenerator()
      }
    }
  }
  
  private func requiredArguments() -> Array<String> {
    return [
      self.inputPath,
      self.outputPath,
      self.fileName,
    ]
  }
  
  private func fileFormat() -> FileFormatStrategy? {
    var format: FileFormatStrategy?
    if self.language == "swift" {
      format = FileFormatSwiftStrategy()
    } else if self.language == "objc" {
      format = FileFormatObjectiveCStrategy()
    }
    return format
  }
  
  private func createGenerator() {
    let generator = ColourGenerator(inputPath: self.inputPath,
                                    outputPath: self.outputPath,
                                    fileName: self.fileName,
                                    prefix: self.prefix,
                                    fileFormatStrategy: self.fileFormat()!)
    generator.generateColours()
  }
  
}
