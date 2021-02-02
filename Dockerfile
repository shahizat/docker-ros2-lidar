FROM arm64v8/ros:foxy

WORKDIR /root
SHELL [ "bash", "-c"]
ENV ROS_WS /ros

RUN apt-get update && apt-get install -y \
    nano &&\
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${ROS_WS}/src \
&&  cd ${ROS_WS}/src \
&&  git clone https://github.com/youtalk/rplidar_ros.git

RUN bash -c "cd ${ROS_WS} \
&&  source /opt/ros/foxy/setup.bash \
&&  colcon build --symlink-install"
