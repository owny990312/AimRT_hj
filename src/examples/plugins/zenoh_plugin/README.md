# zenoh plugin examples

## protobuf rpc

一个基于 protobuf 协议、协程型接口与 zenoh 后端的 rpc 示例，演示内容包括：
- 如何在配置文件中加载**zenoh_plugin**；
- 如何使用 zenoh 类型的 rpc 后端；

核心代码：
- [rpc.proto](../../../protocols/example/rpc.proto)
- [normal_rpc_co_client_module.cc](../../cpp/pb_rpc/module/normal_rpc_co_client_module/normal_rpc_co_client_module.cc)
- [normal_rpc_co_server_module.cc](../../cpp/pb_rpc/module/normal_rpc_co_server_module/normal_rpc_co_server_module.cc)
- [service.cc](../../cpp/pb_rpc/module/normal_rpc_co_server_module/service.cc)


配置文件：
- [examples_plugins_zenoh_plugin_pb_rpc_client_cfg.yaml](./install/linux/bin/cfg/examples_plugins_zenoh_plugin_pb_rpc_client_cfg.yaml)
- [examples_plugins_zenoh_plugin_pb_rpc_server_cfg.yaml](./install/linux/bin/cfg/examples_plugins_zenoh_plugin_pb_rpc_server_cfg.yaml)


运行方式（linux）：
- 开启 `AIMRT_BUILD_EXAMPLES`、`AIMRT_BUILD_ZENOH_PLUGIN` 选项编译 AimRT（编译时需要提前准备好rust编译环境）；
- 编译成功后，先运行 build 目录下`start_examples_plugins_zenoh_plugin_pb_rpc_server.sh`脚本启动订阅端（srv 进程）；
- 再开启一个新的终端窗口运行`start_examples_plugins_zenoh_plugin_pb_rpc_client.sh`脚本启动发布端（cli 进程）；
- 分别在两个终端键入`ctrl-c`停止对应进程；

说明：
- 此示例创建了以下两个模块：
  - `NormalRpcCoClientModule`：会基于 `work_thread_pool` 执行器，以配置的频率，通过协程 Client 接口，向 `ExampleService` 发起 RPC 请求；
  - `NormalRpcCoServerModule`：会注册 `ExampleService` 服务端，通过协程 Server 接口，提供 echo 功能；
- 此示例在 Rpc Client 端和 Server 端分别注册了两个 Filter 用于打印请求日志和计算耗时；
- 此示例将 `NormalRpcCoClientModule` 和 `NormalRpcCoServerModule` 分别集成到 `pb_rpc_client_pkg` 和 `pb_rpc_server_pkg` 两个 Pkg 中，并在两个配置文件中分别加载对应的 Pkg 到 srv 和 cli 进程中；
- 此示例加载了**zenoh_plugin**，并使用 zenoh 类型的 rpc 后端进行通信，此外还在客户端配置了 `timeout_handle` 执行器作为超时执行器；
  

## ros2 rpc

一个基于 ros2 srv 协议、协程型接口与 zenoh 后端的 rpc 示例，演示内容包括：
- 如何在配置文件中加载**zenoh_plugin**；
- 如何使用 zenoh 类型的 rpc 后端；

核心代码：
- [example_ros2/srv/RosTestRpc.srv](../../../protocols/example_ros2/srv/RosTestRpc.srv)
- [normal_rpc_co_client_module.cc](../../cpp/ros2_rpc/module/normal_rpc_co_client_module/normal_rpc_co_client_module.cc)
- [normal_rpc_co_server_module.cc](../../cpp/ros2_rpc/module/normal_rpc_co_server_module/normal_rpc_co_server_module.cc)
- [service.cc](../../cpp/ros2_rpc/module/normal_rpc_co_server_module/service.cc)

配置文件：
- [examples_plugins_zenoh_plugin_ros2_rpc_client_cfg.yaml](./install/linux/bin/cfg/examples_plugins_zenoh_plugin_ros2_rpc_client_cfg.yaml)
- [examples_plugins_zenoh_plugin_ros2_rpc_server_cfg.yaml](./install/linux/bin/cfg/examples_plugins_zenoh_plugin_ros2_rpc_server_cfg.yaml)
- 

运行方式（linux）：
- 开启 `AIMRT_BUILD_EXAMPLES`、`AIMRT_BUILD_ZENOH_PLUGIN` 选项编译 AimRT（编译时需要提前准备好rust编译环境）；
- 编译成功后，先运行 build 目录下`start_examples_plugins_zenoh_plugin_ros2_rpc_server.sh`脚本启动订阅端（srv 进程）；
- 再开启一个新的终端窗口运行`start_examples_plugins_zenoh_plugin_ros2_rpc_client.sh`脚本启动发布端（cli 进程）；
- 分别在两个终端键入`ctrl-c`停止对应进程；

说明：
- 本示例与 **protobuf rpc** 示例基本一致，除了业务层使用的是 ros2 srv 形式的协议；

## protobuf channel

一个基于 protobuf 协议与 zenoh 后端的 channel 示例，演示内容包括：
- 如何在配置文件中加载**zenoh_plugin**；
- 如何使用 zenoh 类型的 channel 后端；


核心代码：
- [event.proto](../../../protocols/example/event.proto)
- [normal_publisher_module.cc](../../cpp/pb_chn/module/normal_publisher_module/normal_publisher_module.cc)
- [normal_subscriber_module.cc](../../cpp/pb_chn/module/normal_subscriber_module/normal_subscriber_module.cc)


配置文件：
- [examples_plugins_zenoh_plugin_pb_chn_pub_cfg.yaml](./install/linux/bin/cfg/examples_plugins_zenoh_plugin_pb_chn_pub_cfg.yaml)
- [examples_plugins_zenoh_plugin_pb_chn_sub_cfg.yaml](./install/linux/bin/cfg/examples_plugins_zenoh_plugin_pb_chn_sub_cfg.yaml)


运行方式（linux）：
- 开启 `AIMRT_BUILD_EXAMPLES`、`AIMRT_BUILD_ZENOH_PLUGIN` 选项编译 AimRT（编译时需要提前准备好rust编译环境）；
- 编译成功后，先运行 build 目录下`start_examples_plugins_zenoh_plugin_pb_chn_sub.sh`脚本启动订阅端（sub 进程）；
- 再开启一个新的终端窗口运行`start_examples_plugins_zenoh_plugin_pb_chn_pub.sh`脚本启动发布端（pub 进程）；
- 分别在两个终端键入`ctrl-c`停止对应进程；


说明：
- 此示例创建了以下两个模块：
  - `NormalPublisherModule`：会基于 `work_thread_pool` 执行器，以配置的频率、向配置的 topic 中发布 `ExampleEventMsg` 类型的消息；
  - `NormalSubscriberModule`：会订阅配置的 topic 下的 `ExampleEventMsg` 类型的消息；
- 此示例将 `NormalPublisherModule` 和 `NormalSubscriberModule` 分别集成到 `pb_chn_pub_pkg` 和 `pb_chn_sub_pkg` 两个 Pkg 中，并在两个配置文件中分别加载对应的 Pkg 到 pub 和 sub 进程中；
- 此示例加载了**zenoh_plugin**，并使用 zenoh 类型的 channel 后端进行通信；


## ros2 channel

一个基于 ros2 msg 协议与 zenoh 后端的 channel 示例，演示内容包括：
- 如何在配置文件中加载**zenoh_plugin**；
- 如何使用 zenoh 类型的 channel 后端；



核心代码：
- [example_ros2/msg/RosTestMsg.msg](../../../protocols/example_ros2/msg/RosTestMsg.msg)
- [normal_publisher_module.cc](../../cpp/ros2_chn/module/normal_publisher_module/normal_publisher_module.cc)
- [normal_subscriber_module.cc](../../cpp/ros2_chn/module/normal_subscriber_module/normal_subscriber_module.cc)


配置文件：
- [examples_plugins_zenoh_plugin_ros2_chn_pub_cfg.yaml](./install/linux/bin/cfg/examples_plugins_zenoh_plugin_ros2_chn_pub_cfg.yaml)
- [examples_plugins_zenoh_plugin_ros2_chn_sub_cfg.yaml](./install/linux/bin/cfg/examples_plugins_zenoh_plugin_ros2_chn_sub_cfg.yaml)


- 开启 `AIMRT_BUILD_EXAMPLES`、`AIMRT_BUILD_ZENOH_PLUGIN` 选项编译 AimRT（编译时需要提前准备好rust编译环境）；
- 编译成功后，先运行 build 目录下`start_examples_plugins_zenoh_plugin_ros2_chn_sub.sh`脚本启动订阅端（sub进程）；
- 再开启一个新的终端窗口运行`start_examples_plugins_zenoh_plugin_ros2_chn_pub.sh`脚本启动发布端（pub进程）；
- 分别在两个终端键入`ctrl-c`停止对应进程；


说明：
- 本示例与 **protobuf rpc** 示例基本一致，除了业务层使用的是 ros2 msg 形式的协议；