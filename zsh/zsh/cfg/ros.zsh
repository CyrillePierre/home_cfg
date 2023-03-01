source_ros() { 
	source ~/projects/ros/devel/setup.zsh
	export ROSCONSOLE_FORMAT='[${severity}] [${node}]: ${message}'
}

source_isibot() {
	source ~/projects/ros_isibot/local/devel/setup.zsh
	export ROSCONSOLE_FORMAT='[${severity}] [${node}]: ${message}'
}

source_tiara() {
	source ~/projects/tiara_ws/devel/setup.zsh
	export ROSCONSOLE_FORMAT='[${severity}] ${node}: ${message}'
	export GAZEBO_RESOURCE_PATH="$HOME/data/tiara/gazebo"
	export GAZEBO_MODEL_PATH="$HOME/data/tiara/gazebo/models"
}

source_tiara2() {
  unset ROS_DISTRO
  source /opt/ros/galactic/setup.zsh
  source ~/projects/tiara_ros2/install/local_setup.zsh
  source /usr/share/colcon_cd/function/colcon_cd.sh
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
  export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity}] {name}: {message}"
	export GAZEBO_RESOURCE_PATH="$HOME/data/tiara/gazebo"
	export GAZEBO_MODEL_PATH="$HOME/data/tiara/gazebo/models"
}

source_romea2() {
  unset ROS_DISTRO
  source /usr/share/gazebo/setup.sh
  source /opt/ros/galactic/setup.zsh
  source ~/projects/romea_ros2/install/local_setup.zsh
  source /usr/share/colcon_cd/function/colcon_cd.sh
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
  export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity}] {name}: {message}"
}
