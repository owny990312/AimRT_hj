#!/bin/bash

curl -i \
    -H 'content-type:application/json' \
    -X POST 'http://127.0.0.1:50080/rpc/example_ros2/srv/RosTestRpc' \
    -d '{"data": [1, 2, 3]}'