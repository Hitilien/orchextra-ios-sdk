#!/bin/bash

TEST_CMD="xcodebuild -scheme Orchextra -project Orchextra.xcodeproj -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6S,OS=9.2' build test"

which -s xcpretty
XCPRETTY_INSTALLED=$?

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
  eval "${TEST_CMD} | xcpretty"
else
  eval "$TEST_CMD"
fi