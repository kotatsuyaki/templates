cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
project(main VERSION 1.0)

add_executable(
    ${PROJECT_NAME}
    ./src/main.cpp
)
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 17)


# Lint for unused includes
find_program(iwyu_path NAMES include-what-you-use iwyu REQUIRED)
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_INCLUDE_WHAT_YOU_USE ${iwyu_path})


# Linux-specific options
if(NOT WIN32)
  add_compile_options(-Wall -Wextra)
  install(TARGETS ${PROJECT_NAME} DESTINATION bin)
endif()


# Export compile commands for clangd
if(DEFINED ENV{CMAKE_EXPORT_COMPILE_COMMANDS})
  message(STATUS "Exporting compile commands")
  set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()
