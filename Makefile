TWCColourGenerator: TWCColourGenerator.xcarchive
	cp $</Products/usr/local/bin/$@ $@
	rm -rf $<

TWCColourGenerator.xcarchive:
	xcodebuild -scheme TWCColourGenerator\
		-archivePath TWCColourGenerator/ archive
