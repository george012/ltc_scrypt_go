# 设置系统名称为 Linux
set(CMAKE_SYSTEM_NAME Linux)

# 设置处理器架构
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# 获取主机系统类型
execute_process(
    COMMAND uname -s
    OUTPUT_VARIABLE HOST_OS
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# 设置编译器
if(HOST_OS STREQUAL "Linux")
    set(CMAKE_C_COMPILER x86_64-linux-gnu-gcc)
    set(CMAKE_CXX_COMPILER x86_64-linux-gnu-g++)
else()
    set(CMAKE_C_COMPILER x86_64-linux-musl-gcc)
    set(CMAKE_CXX_COMPILER x86_64-linux-musl-g++)
endif()

# 设置工具链路径
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
