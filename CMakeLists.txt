cmake_minimum_required(VERSION 3.0)
project(learnopengl LANGUAGES C CXX)

find_package(glfw3 3.3 REQUIRED)
find_package(assimp REQUIRED)

include_directories(src include)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99")
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED true)

set(SOURCES
    src/glad.c
    src/stb_image.c
    src/main.cpp
    src/mesh.cpp
    src/model.cpp
)

add_executable(main ${SOURCES})
target_link_libraries(main glfw dl assimp)
add_custom_command(TARGET main POST_BUILD
                   COMMAND ${CMAKE_COMMAND} -E copy_directory
                       ${CMAKE_SOURCE_DIR}/shaders $<TARGET_FILE_DIR:main>/shaders)
add_custom_command(TARGET main POST_BUILD
                   COMMAND ${CMAKE_COMMAND} -E copy_directory
                       ${CMAKE_SOURCE_DIR}/textures $<TARGET_FILE_DIR:main>/textures)
add_custom_command(TARGET main POST_BUILD
                   COMMAND ${CMAKE_COMMAND} -E copy_directory
                       ${CMAKE_SOURCE_DIR}/models $<TARGET_FILE_DIR:main>/models)
