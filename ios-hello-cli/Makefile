# Path to C compiler
CC = $(shell xcrun --sdk iphoneos --find cc)

# Path to iOS SDK (XCode must be installed)
SDK = $(shell xcrun --sdk iphoneos --show-sdk-path)

# Arch. list (remove unnecessary arches), will create a fat/universal binary
ARCH_FLAGS = -arch armv7 -arch armv7s -arch arm64

# C compiler options
CFLAGS = -Os -Wimplicit -isysroot $(SDK) $(ARCH_FLAGS)
LDFLAGS = -isysroot $(SDK) $(ARCH_FLAGS)

include vars.mk

.PHONY: all clean sign

# Compile mail.o -> hellow (the final binary)
all: hello

hello: hello.o

hello.o: hello.c

# Sign the final binary with the certificate (see above)
sign: hello
	codesign -fs "$(CERT_ID)" $^

hello_arm64: hello
	$(JTOOL) -arch arm64 -e arch $<
	mv hello.arch_arm64 $@
	chmod a+x $@

# Add entitlement and self sign binary.
hello_ent: hello_arm64 ent.xml
	JDEBUG=1 $(JTOOL) -arch arm64 --sign --ent ent.xml $<
	mv out.bin $@

clean:
	-rm -f *~
	-rm -f hello.o
	-rm -f hello hello_arm64 hello_ent
