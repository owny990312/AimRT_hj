# Copyright (c) 2023, AgiBot Inc.
# All rights reserved.

# Get the current folder name
string(REGEX REPLACE ".*/\(.*\)" "\\1" CUR_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# Set namespace
set_namespace()

# assistant
add_subdirectory(assistant/native_ros2_chn_publisher)
add_subdirectory(assistant/native_ros2_chn_subscriber)
add_subdirectory(assistant/native_ros2_rpc_client)
add_subdirectory(assistant/native_ros2_rpc_server)

if(AIMRT_BUILD_WITH_PROTOBUF)
  add_subdirectory(assistant/native_ros2_pb_chn_publisher)
  add_subdirectory(assistant/native_ros2_pb_chn_subscriber)
  add_subdirectory(assistant/native_ros2_pb_rpc_client)
  add_subdirectory(assistant/native_ros2_pb_rpc_server)
endif()

# install
if(CMAKE_SYSTEM_NAME MATCHES "Linux")
  set(CUR_INSTALL_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/install/linux)
elseif(CMAKE_SYSTEM_NAME MATCHES "Windows")
  set(CUR_INSTALL_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/install/win)
else()
  message(FATAL_ERROR "Unsupport os")
endif()

# build all
get_namespace(CUR_SUPERIOR_NAMESPACE)
string(REPLACE "::" "_" CUR_SUPERIOR_NAMESPACE_UNDERLINE ${CUR_SUPERIOR_NAMESPACE})
add_custom_target(
  ${CUR_SUPERIOR_NAMESPACE_UNDERLINE}_${CUR_DIR}_build_all ALL
  COMMAND ${CMAKE_COMMAND} -E copy_directory ${CUR_INSTALL_SOURCE_DIR}/bin ${CMAKE_BINARY_DIR}
  DEPENDS aimrt::runtime::main
          aimrt::examples::cpp::ros2_rpc::ros2_rpc_client_pkg
          aimrt::examples::cpp::ros2_rpc::ros2_rpc_server_pkg
          aimrt::examples::cpp::ros2_chn::ros2_chn_pub_pkg
          aimrt::examples::cpp::ros2_chn::ros2_chn_sub_pkg)

if(AIMRT_BUILD_WITH_PROTOBUF)
  add_dependencies(
    ${CUR_SUPERIOR_NAMESPACE_UNDERLINE}_${CUR_DIR}_build_all #
    aimrt::examples::cpp::pb_rpc::pb_rpc_client_pkg #
    aimrt::examples::cpp::pb_rpc::pb_rpc_server_pkg #
    aimrt::examples::cpp::pb_chn::pb_chn_pub_pkg #
    aimrt::examples::cpp::pb_chn::pb_chn_sub_pkg)
endif()
