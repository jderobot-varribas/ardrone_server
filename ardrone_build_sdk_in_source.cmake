cmake_minimum_required(VERSION 2.8)

project(build_ardronelib)

## Build ARDrone SDK here
set (ARDRONE_SDK_FLAVOR "autonomy-gps")
# official-patched
# autonomy-lastest
# autonomy-gps


if (${ARDRONE_SDK_FLAVOR} STREQUAL "official-patched")
    set(GIT_TAG bdacd1cbd3fbc54263d29e6e2067265e5941d10e)
elseif (${ARDRONE_SDK_FLAVOR} STREQUAL "autonomy-lastest")
    set(GIT_TAG master)
elseif (${ARDRONE_SDK_FLAVOR} STREQUAL "autonomy-gps")
    set(GIT_TAG gps)
endif()

message("ardronelib version: ${ARDRONE_SDK_FLAVOR}")
set(ARDRONE_SDK_NAME "ardronelib" )
set(ARDRONE_SDK ${CMAKE_BINARY_DIR}/src/${ARDRONE_SDK_NAME}/ARDroneLib)
set(ARDRONE_SDK_LIB_PATH ${CMAKE_BINARY_DIR}/lib/ardrone)

include(ExternalProject)
ExternalProject_Add(ardronelib
        GIT_REPOSITORY git://github.com/AutonomyLab/ardronelib.git
        GIT_TAG ${GIT_TAG}
        PREFIX ${CMAKE_BINARY_DIR}
        CONFIGURE_COMMAND echo "No configure"
        BUILD_COMMAND make
        INSTALL_COMMAND make install INSTALL_PREFIX=${ARDRONE_SDK_LIB_PATH}
        BUILD_IN_SOURCE 1
)


## Include ARDrone into build toolchain
message( "ARDrone SDK at ${ARDRONE_SDK}" )
message( "ARDrone LIBS at ${ARDRONE_SDK_LIB_PATH}" )

include_directories(
    ${ARDRONE_SDK}
    ${ARDRONE_SDK}/FFMPEG/Includes
    ${ARDRONE_SDK}/Soft/Common
    ${ARDRONE_SDK}/Soft/Lib
    ${ARDRONE_SDK}/VP_SDK
    ${ARDRONE_SDK}/VP_SDK/VP_Os/linux
)
link_directories(${ARDRONE_SDK_LIB_PATH})

