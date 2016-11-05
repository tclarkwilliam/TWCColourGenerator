## TWCColourGenerator

Custom colour palettes can be created in Xcode and are stored in `~/Library/Colors`. This tool generates RGB values from each colour in the palette, which can then be used in code.

Support is included for both Swift and Objective-C. Pass in the required language as an argument using `-l` in the format `objc` or `swift`.

### Usage
- Clone the project
- Build
- Copy the executable in the Products directory to Applications
- cd into the Applications directory

#### Command line arguments
`./TWCColourGenerator -i <~/path> -o <~/path> -n <name> -l <language>`

Required:
- `-i <~/path> Path to and including .clr file`
- `-o <~/path> Path to dump file`
- `-n <name> Extension name`
- `-l <language (objc / swift)> Language`

Optional:
- `-p <prefix> Prefix for colour name function`
- `-h Help`
