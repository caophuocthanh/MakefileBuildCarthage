#!/bin/sh

BUILD_FOLDER=./Build
TARGET=UniversalCalendar

GIT=https://github.com/haithngn/Calendar.git
GIT_BRANCH=master

.PHONY: build clean

build:
	# setup build
	rm -rf ${BUILD_FOLDER};
	mkdir ${BUILD_FOLDER};
	touch ${BUILD_FOLDER}/Cartfile;
	echo 'github "${GIT}" "${GIT_BRANCH}"'  >> ${BUILD_FOLDER}/Cartfile;
	
	# build carthage
	cd ${BUILD_FOLDER} && carthage update --platform iOS;
	cd ${BUILD_FOLDER} && carthage build --platform iOS;
	
	# check success or fail
	if [ -d ${BUILD_FOLDER}/Carthage/Build/iOS/${TARGET}.framework ]; \
	then \
	echo "SUCCESS"; \
	open ${BUILD_FOLDER}/Carthage/Build/iOS/; \
	else \
	echo "FAIL"; \
	fi

clean:
	rm -rf ${BUILD_FOLDER}



