
if (NOT DEFINED ARDRONE_SDK)
	include(ardrone_build_sdk_in_source.cmake)
	SET(ARDRONE_LIB_PATH "${ARDRONE_SDK_LIB_PATH}")
endif()

include(ardrone_sdk_check_deps.cmake)

if(ARDRONE_ALL_DEPS)
    project(ardrone_server)

#    # Ice msg
#    set(SLICE_OUTPUT ${CMAKE_BINARY_DIR}/slice-include/${PROJECT_NAME})
#    add_custom_target(compile_ice ALL
#        COMMAND mkdir -p ${SLICE_OUTPUT}
#        COMMAND slice2cpp --underscore ${CMAKE_CURRENT_SOURCE_DIR}/slice/*.ice --output-dir=${SLICE_OUTPUT}
#    )
#    include_directories(${SLICE_OUTPUT})


	set(CMAKE_CXX_FLAGS "-w -lIce -lIceUtil")

	include_directories(
		${INTERFACES_CPP_DIR}
		${OpenCV_INCLUDE_DIR}
		${Ice_INCLUDE_DIR}
		${LIBS_DIR}
		${Boost_INCLUDE_DIR}
		${EIGEN_INCLUDE_DIR}
		${libxmlpp_INCLUDE_DIRS}
		)
        

        include_directories(include)


        add_executable(ardrone_server   src/ardrone_driver.cpp
                                        src/ardrone_parser.cpp
                                        src/ardrone_config.cpp
					src/ardrone_sdk.cpp 
					src/teleop_twist.cpp
                                        src/video.cpp
					src/components/cameraserver.cpp 
					src/components/cmdveli.cpp				
					src/components/pose3di.cpp
					src/components/remoteconfigi.cpp
                                        src/components/navdatai.cpp
                                        src/components/ardroneextrai.cpp
                                        src/components/navdatagpsi.cpp
        )

	target_link_libraries(ardrone_server 
				${ARDRONE_PCDRONE_LIB} 
				${ARDRONE_AVCODEC_LIB} 
				${ARDRONE_AVUTIL_LIB} 
				${ARDRONE_SWSCALE_LIB} 
				${ARDRONE_VLIB_LIB}  
				${ARDRONE_SDK_LIB} 
				SDL 
				${CMAKE_THREAD_LIBS_INIT})

	target_link_libraries(ardrone_server
				${OpenCV_LIBRARIES}
				${ZeroCIce_LIBRARIES}
				colorspacesmm
				JderobotInterfaces
				${libxmlpp_LIBRARIES})

	add_custom_command(TARGET ardrone_server POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy_directory
			${CMAKE_CURRENT_SOURCE_DIR}/config $<TARGET_FILE_DIR:ardrone_server>/config)

	add_custom_command(TARGET ardrone_server POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy_if_different
			${CMAKE_CURRENT_SOURCE_DIR}/ardrone_interfaces.cfg $<TARGET_FILE_DIR:ardrone_server>)

ELSE()
	message(WARNING "ardrone_server marked to build, but required dependencies were not met.
		You should run make twice to link in-source generated ardonelib")
ENDIF()
