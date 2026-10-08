cmake_minimum_required(VERSION 3.20)

project(sokol_multiplatform
    VERSION 1.0
    LANGUAGES C CXX
)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)

include(FetchContent)

FetchContent_Declare(
    sokol
    GIT_REPOSITORY https://github.com/floooh/sokol.git
    GIT_TAG master
)

FetchContent_MakeAvailable(sokol)

set(SOURCES
    src/main.c
    src/game.c
    src/collision.c
    src/sokol_impl.c
)

add_executable(sokol_collision ${SOURCES})

target_include_directories(sokol_collision PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/src"
    "${sokol_SOURCE_DIR}"
    "${sokol_SOURCE_DIR}/util"
)

if(EMSCRIPTEN)

    message(STATUS "Configuring Sokol for Web / Emscripten")

    target_compile_definitions(sokol_collision PRIVATE
        SOKOL_GLES3
    )

    set_target_properties(sokol_collision PROPERTIES
        SUFFIX ".html"
    )

    target_link_options(sokol_collision PRIVATE
        "-sUSE_WEBGL2=1"
        "-sFULL_ES3=1"
        "-sALLOW_MEMORY_GROWTH=1"
    )

elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")

    message(STATUS "Configuring Sokol for Windows / Direct3D 11")

    target_compile_definitions(sokol_collision PRIVATE
        SOKOL_D3D11
    )

    target_link_libraries(sokol_collision PRIVATE
        d3d11
        dxgi
        user32
        gdi32
        shell32
        ole32
    )

elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")

    message(STATUS "Configuring Sokol for macOS / Metal")

    enable_language(OBJC)

    target_compile_definitions(sokol_collision PRIVATE
        SOKOL_METAL
    )

    set_source_files_properties(
        src/sokol_impl.c
        PROPERTIES
        LANGUAGE OBJC
    )

    target_link_libraries(sokol_collision PRIVATE
        "-framework Cocoa"
        "-framework QuartzCore"
        "-framework Metal"
        "-framework MetalKit"
    )

elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")

    message(STATUS "Configuring Sokol for Linux / OpenGL")

    target_compile_definitions(sokol_collision PRIVATE
        SOKOL_GLCORE
    )

    find_package(OpenGL REQUIRED)
    find_package(X11 REQUIRED)

    target_link_libraries(sokol_collision PRIVATE
        OpenGL::GL
        X11::X11
        X11::Xi
        X11::Xcursor
        dl
        pthread
        m
    )

else()

    message(FATAL_ERROR
        "Plataforma nao suportada: ${CMAKE_SYSTEM_NAME}"
    )

endif()

if(MSVC)

    target_compile_options(sokol_collision PRIVATE
        /W4
    )

else()

    target_compile_options(sokol_collision PRIVATE
        -Wall
        -Wextra
        -Wpedantic
    )

endif()

message(STATUS "========================================")
message(STATUS " Sokol Multiplatform")
message(STATUS " Sistema: ${CMAKE_SYSTEM_NAME}")
message(STATUS " Compilador C: ${CMAKE_C_COMPILER}")
message(STATUS " Compilador C++: ${CMAKE_CXX_COMPILER}")
message(STATUS "========================================")
