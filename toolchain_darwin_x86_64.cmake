# 设置系统名称为 Darwin
set(CMAKE_SYSTEM_NAME Darwin)

# 设置处理器架构
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# 获取主机系统类型
execute_process(
    COMMAND uname -s
    OUTPUT_VARIABLE HOST_OS
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# 设置编译器
if(HOST_OS STREQUAL "Darwin")
    set(CMAKE_C_COMPILER clang)
    set(CMAKE_CXX_COMPILER clang++)
else()
    set(CMAKE_C_COMPILER o64-clang)
    set(CMAKE_CXX_COMPILER o64-clang++)
endif()

# 设置工具链路径
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
