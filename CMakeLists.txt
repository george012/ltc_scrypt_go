cmake_minimum_required(VERSION 3.10)
project(scrypt)

set(LIB_NAME scrypt)

add_definitions(-DUSE_SSE2_ALWAYS)

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/include)

# Source files
file(GLOB SRC_C_FILES "${PROJECT_SOURCE_DIR}/src/*.c")
file(GLOB SRC_CPP_FILES "${PROJECT_SOURCE_DIR}/src/*.cpp")
file(GLOB_RECURSE SRC_C_FILES_RECURSE "${PROJECT_SOURCE_DIR}/src/**/*.c")
file(GLOB_RECURSE SRC_CPP_FILES_RECURSE "${PROJECT_SOURCE_DIR}/src/**/*.cpp")

# Combine all source files into one list
set(SRC_DIR_LIST ${SRC_C_FILES} ${SRC_CPP_FILES} ${SRC_C_FILES_RECURSE} ${SRC_CPP_FILES_RECURSE})

if(NOT DEFINED BUILD_ARCH)
    set(BUILD_ARCH "x86_64")
endif()

# Detect system type
if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    set(SYSTEM_TYPE "Linux")
    if(BUILD_ARCH STREQUAL "arm64")
        message(STATUS "Building on Linux for ARM64")
        set(LIB_NAME "${LIB_NAME}_arm64")
    elseif(BUILD_ARCH STREQUAL "x86_64")
        message(STATUS "Building on Linux for x86_64")
    endif()
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    set(SYSTEM_TYPE "Windows")
    set(CMAKE_SYSTEM_VERSION 10.0)
    add_definitions(-DTEST_EXPORTS) # Only add -DTEST_EXPORTS on Windows

    if(USE_MSVC)
        message(STATUS "Using MSVC specific options")
        add_compile_options(/utf-8)
    endif()

    if(BUILD_ARCH STREQUAL "arm64")
        message(STATUS "Building on Windows for ARM64")
        set(LIB_NAME "${LIB_NAME}_arm64")
        set(CMAKE_SYSTEM_PROCESSOR "arm64")
    elseif(BUILD_ARCH STREQUAL "x86_64")
        message(STATUS "Building on Windows for x86_64")
        set(CMAKE_SYSTEM_PROCESSOR "x86_64")
    endif()
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
    set(SYSTEM_TYPE "Darwin")
    set(CMAKE_OSX_DEPLOYMENT_TARGET 12.0) # 添加此行设置 macOS 部署目标版本
    if(BUILD_ARCH STREQUAL "arm64")
        message(STATUS "Building for arm64 on Darwin")
        set(LIB_NAME "${LIB_NAME}_arm64")
        set(CMAKE_OSX_ARCHITECTURES "arm64")
    elseif(BUILD_ARCH STREQUAL "x86_64")
        message(STATUS "Building for x86_64 on Darwin")
        set(CMAKE_OSX_ARCHITECTURES "x86_64")
    endif()
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Android")
    set(SYSTEM_TYPE "Android")
    set(LIB_NAME "${LIB_NAME}")
    set(ANDROID_PLATFORM 21) # 设置 Android 最低平台版本
    if(BUILD_ARCH STREQUAL "armeabi-v7a")
        message(STATUS "Building on Android for armeabi-v7a")
    elseif(BUILD_ARCH STREQUAL "arm64-v8a")
        message(STATUS "Building on Android for arm64-v8a")
    elseif(BUILD_ARCH STREQUAL "x86")
        message(STATUS "Building on Android for x86")
    elseif(BUILD_ARCH STREQUAL "x86_64")
        message(STATUS "Building on Android for x86_64")
    endif()
endif()


# Check if OpenSSL is found
find_package(OpenSSL REQUIRED)
if(OPENSSL_FOUND)
    include_directories(${OPENSSL_INCLUDE_DIR})
    message(STATUS "OpenSSL include directory: ${OPENSSL_INCLUDE_DIR}")
else()
    message(FATAL_ERROR "OpenSSL not found!")
endif()

# Build library
add_library(${LIB_NAME} STATIC ${SRC_DIR_LIST})
target_link_libraries(${LIB_NAME} ${OPENSSL_LIBRARIES})

set_target_properties(${LIB_NAME} PROPERTIES SUFFIX ".a")

