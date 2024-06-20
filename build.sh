#!/bin/bash
set -e

CUSTOM_PROJECT_NAME=scrypt

PROJECT_PATH=$(cd `dirname $0`; pwd)
BUILD_DIR="./build"


OS_TYPE="Unknown"
GetOSType(){
    uNames=`uname -s`
    osName=${uNames: 0: 4}
    if [ "$osName" == "Darw" ] # Darwin
    then
        OS_TYPE="Darwin"
    elif [ "$osName" == "Linu" ] # Linux
    then
        OS_TYPE="Linux"
    elif [ "$osName" == "MING" ] # MINGW, windows, git-bash
    then
        OS_TYPE="Windows"
    else
        OS_TYPE="Unknown"
    fi
}
GetOSType

PackageFiles(){
    cd ${BUILD_DIR}
    echo currnt run path with $(pwd)
    zip -q -r lib${CUSTOM_PROJECT_NAME}_all_platforms.zip ./${CUSTOM_PROJECT_NAME}
    cd ../
}

BuildMacX64() {
    echo "----------------build with Darwin-------------------x86_64-----------------"

    mkdir -p ${BUILD_DIR}/darwin/x86_64
    cd ${BUILD_DIR}/darwin/x86_64

    if [[ "$OS_TYPE" == "Darwin" ]]; then
        cmake ../../../ -DBUILD_ARCH=x86_64 -DCMAKE_OSX_DEPLOYMENT_TARGET=12.0
    else
        cmake ../../../ -DCMAKE_TOOLCHAIN_FILE=${PROJECT_PATH}/toolchain_darwin_x86_64.cmake -DBUILD_ARCH=x86_64 -DCMAKE_OSX_DEPLOYMENT_TARGET=12.0
    fi

    cmake ../../../ -DBUILD_ARCH=x86_64
    cmake --build .
    cd ../../../
    echo current path $(pwd)
    cp -f ${BUILD_DIR}/darwin/x86_64/lib${CUSTOM_PROJECT_NAME}.a ${BUILD_DIR}/../lib/darwin/lib${CUSTOM_PROJECT_NAME}.a
}

BuildMacARM64() {
    echo "----------------build with Darwin-------------------arm64-----------------"

    mkdir -p ${BUILD_DIR}/darwin/arm64
    cd ${BUILD_DIR}/darwin/arm64

    if [[ "$OS_TYPE" == "Darwin" ]]; then
        cmake ../../../ -DBUILD_ARCH=arm64 -DCMAKE_OSX_DEPLOYMENT_TARGET=12.0
    else
        cmake ../../../ -DCMAKE_TOOLCHAIN_FILE=${PROJECT_PATH}/toolchain_darwin_arm64.cmake -DBUILD_ARCH=arm64 -DCMAKE_OSX_DEPLOYMENT_TARGET=12.0
    fi

    cmake ../../../ -DBUILD_ARCH=arm64
    cmake --build .
    cd ../../../

    cp -f ${BUILD_DIR}/darwin/arm64/lib${CUSTOM_PROJECT_NAME}_arm64.a ${BUILD_DIR}/../lib/darwin/lib${CUSTOM_PROJECT_NAME}_arm64.a
}

BuildMacUniversal() {
    echo "----------------build with Darwin---------------"

    rm -rf ${BUILD_DIR}/darwin
    rm -rf ${BUILD_DIR}/${CUSTOM_PROJECT_NAME}/darwin

    mkdir -p ${BUILD_DIR}/${CUSTOM_PROJECT_NAME}/darwin

    BuildMacX64

    BuildMacARM64

    echo "dylib包arch信息" `lipo -info ${PROJECT_PATH}/lib/darwin/lib${CUSTOM_PROJECT_NAME}.a`
    echo "dylib包arch信息" `lipo -info ${PROJECT_PATH}/lib/darwin/lib${CUSTOM_PROJECT_NAME}_arm64.a`
}

BuildLinuxX64() {
    echo "----------------build with Linux-------------------x86_64-----------------"

    mkdir -p ${BUILD_DIR}/linux/x86_64
    cd ${BUILD_DIR}/linux/x86_64

    if [[ "$OS_TYPE" == "Linux" ]];then
        cmake ../../../ -DBUILD_ARCH=x86_64
    else
        cmake ../../../ -DCMAKE_TOOLCHAIN_FILE=${PROJECT_PATH}/toolchain_linux_x86_64.cmake -DBUILD_ARCH=x86_64
    fi

    cmake --build .
    cd ../../../
    echo `pwd`
    cp -f ${BUILD_DIR}/linux/x86_64/lib${CUSTOM_PROJECT_NAME}.a ${BUILD_DIR}/../lib/linux/lib${CUSTOM_PROJECT_NAME}.a
}

BuildLinuxARM64() {
    echo "----------------build with Linux-------------------arm64-----------------"

    mkdir -p ${BUILD_DIR}/linux/arm64
    cd ${BUILD_DIR}/linux/arm64

    if [[ "$OS_TYPE" == "Linux" ]];then
        cmake ../../../ -DBUILD_ARCH=arm64
    else
        cmake ../../../ -DCMAKE_TOOLCHAIN_FILE=${PROJECT_PATH}/toolchain_linux_arm64.cmake -DBUILD_ARCH=arm64
    fi

    cmake --build .
    cd ../../../
    echo `pwd`
    cp -f ${BUILD_DIR}/linux/arm64/lib${CUSTOM_PROJECT_NAME}_arm64.a ${BUILD_DIR}/../lib/linux/lib${CUSTOM_PROJECT_NAME}_arm64.a
}

BuildLinuxUniversal() {
    echo "----------------build with Linux---------------"
    rm -rf ${BUILD_DIR}/linux
    rm -rf ${BUILD_DIR}/${CUSTOM_PROJECT_NAME}/linux
    mkdir -p ${BUILD_DIR}/${CUSTOM_PROJECT_NAME}/linux
    BuildLinuxX64 && BuildLinuxARM64
}

BuildWindowsX64() {
    echo "----------------build with Windows-------------------x86_64-----------------"

    mkdir -p ${BUILD_DIR}/windows/x86_64
    cd ${BUILD_DIR}/windows/x86_64

    if [[ "$OS_TYPE" == "Windows" ]];then
        cmake ../../../ -DBUILD_ARCH=x86_64
    else
        cmake ../../../ -DCMAKE_TOOLCHAIN_FILE=${PROJECT_PATH}/toolchain_windows_x86_64.cmake -DBUILD_ARCH=x86_64
    fi

    cmake --build .
    cd ../../../

    cp -f ${BUILD_DIR}/windows/x86_64/lib${CUSTOM_PROJECT_NAME}.a ${BUILD_DIR}/../lib/windows/lib${CUSTOM_PROJECT_NAME}.a
}

BuildWindowsARM64() {
    echo "----------------build with Windows-------------------arm64-----------------"

    mkdir -p ${BUILD_DIR}/windows/arm64
    cd ${BUILD_DIR}/windows/arm64

    if [[ "$OS_TYPE" == "Windows" ]];then
        cmake ../../../ -DBUILD_ARCH=arm64
    else
        cmake ../../../ -DCMAKE_TOOLCHAIN_FILE=${PROJECT_PATH}/toolchain_windows_arm64.cmake -DBUILD_ARCH=arm64
    fi

    cmake --build .
    cd ../../../

    cp -f ${BUILD_DIR}/windows/arm64/lib${CUSTOM_PROJECT_NAME}_arm64.a ${BUILD_DIR}/../lib/windows/lib${CUSTOM_PROJECT_NAME}_arm64.a
}

BuildWindowsUniversal() {
    echo "----------------build with Windows---------------"

    rm -rf ${BUILD_DIR}/windows
    rm -rf ${BUILD_DIR}/${CUSTOM_PROJECT_NAME}/windows
    mkdir -p ${BUILD_DIR}/${CUSTOM_PROJECT_NAME}/windows
    BuildWindowsX64

    # BuildWindowsARM64
}

function BuildAndroid() {
    ANDROID_ABI=${1:-${ANDROID_ABI}}
    echo "----------------build with Android-------------------${ANDROID_ABI}-----------------"

    local A_BUILD_DIR="${BUILD_DIR}/android/${ANDROID_ABI}"

    mkdir -p ${A_BUILD_DIR} \
    && mkdir -p ${BUILD_DIR}/${CUSTOM_PROJECT_NAME}/android/${ANDROID_ABI} \
    && cd ${A_BUILD_DIR} \
    && cmake ../../../ \
        -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake \
        -DANDROID_ABI=${ANDROID_ABI} \
        -DANDROID_PLATFORM=android-21 \
    && cmake --build . \
    && cd ../../../
    echo curren path $(pwd)
    cp -f ${A_BUILD_DIR}/lib${CUSTOM_PROJECT_NAME}.a ${BUILD_DIR}/../lib/android/${ANDROID_ABI}/lib${CUSTOM_PROJECT_NAME}.a
}

function BuildAndroid_All() {
    echo "----------------build with Android---------------"

    if [ -z "$ANDROID_NDK_HOME" ]; then
      echo "[ANDROID_NDK_HOME|ANDROID_NDK] Not Set, Must Install Android NDK And Add [ANDROID_NDK_HOME|ANDROID_NDK] System Path"
      return 1
    fi
    rm -rf ${BUILD_DIR}/android
    rm -rf ${BUILD_DIR}/${CUSTOM_PROJECT_NAME}/android

    BuildAndroid armeabi-v7a \
    && BuildAndroid arm64-v8a \
    && BuildAndroid x86 \
    && BuildAndroid x86_64
}

BuildAll() {
    local RELEASE_DIR=${BUILD_DIR}/${CUSTOM_PROJECT_NAME}
    rm -rf ${RELEASE_DIR}
    mkdir -p ${RELEASE_DIR}
    mkdir -p ${RELEASE_DIR}/include
    cp -f ./include/* ${RELEASE_DIR}/include

    BuildMacUniversal
    BuildLinuxUniversal
    BuildWindowsUniversal
    BuildAndroid_All

    PackageFiles
}

case "$1" in
    all)
        BuildAll
        ;;
    ubuntu-*)
        echo "Linux"
        BuildLinuxUniversal
        ;;
    linux*)
        echo "Linux"
        BuildLinuxUniversal
        ;;
    centos-*)
        echo "Linux"
        BuildLinuxUniversal
        ;;
    macos*)
        echo "Darwin"
        BuildMacUniversal
        ;;
    darwin*)
        echo "Darwin"
        BuildMacUniversal
        ;;
    windows*)
        echo "Windows"
        BuildWindowsUniversal
        ;;
    android)
        echo "Android"
        BuildAndroid_All
        ;;
    *)
        echo "Must start with [all|Linux|Darwin/MacOS|Windows|Android]"
        exit 1
        ;;
esac
