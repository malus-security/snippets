#!/bin/bash

USR_INCLUDE=$(xcrun --sdk iphoneos --show-sdk-path)/usr/include

sudo cp -r missing-headers/* $USR_INCLUDE/

