#-------------------------------------------------------------------------------
# @author           Jean-David Gadina
# @copyright        (c) 2020, Jean-David Gadina - www.xs-labs.com
#-------------------------------------------------------------------------------

.PHONY: all clean distclean checkout update build install

.NOTPARALLEL:

all: checkout update build install
	
	@:
	
clean:
	
	@echo "*** Cleaning all build files"
	@rm -rf build/*

distclean: clean
	
	@echo "*** Cleaning all temporary files"
	@rm -rf source/*

checkout:

	@echo "*** Checking out SwiftFormat"
	@if [ ! -d source/SwiftFormat ]; then git clone https://github.com/macmade/SwiftFormat.git source/SwiftFormat; fi
	
update:
	
	@echo "*** Updating SwiftFormat"
	@cd source/SwiftFormat && git pull
	
build:
	
	@echo "*** Building SwiftFormat"
	@xcodebuild build -project source/SwiftFormat/SwiftFormat.xcodeproj -scheme "SwiftFormat (Command Line Tool)" -configuration "Release" -derivedDataPath build/ CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

install:
	
	@echo "*** Installing SwiftFormat"
	@cp build/Build/Products/Release/swiftformat dist/

