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
	export GAZEBO_RESOURCE_PATH="$HOME/data/tiara/gazebo:$HOME/data/romea/gazebo"
	export GAZEBO_MODEL_PATH="$HOME/data/tiara/gazebo/models:$HOME/data/romea/gazebo/models"
}

source_tiara2() {
  unset ROS_DISTRO
  source /opt/ros/galactic/setup.zsh
  source ~/projects/tiara_ros2/install/local_setup.zsh
  source /usr/share/colcon_cd/function/colcon_cd.sh
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
  export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity}] {name}: {message}"
	export GAZEBO_RESOURCE_PATH="$HOME/data/tiara/gazebo:$HOME/data/romea/gazebo"
	export GAZEBO_MODEL_PATH="$HOME/data/tiara/gazebo/models:$HOME/data/romea/gazebo/models"
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

source_tirrex() {
  unset ROS_DISTRO
  source /usr/share/gazebo/setup.sh
  source /opt/ros/galactic/setup.zsh
  source ~/projects/tirrex_ws/install/local_setup.zsh
  source /usr/share/colcon_cd/function/colcon_cd.sh
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
  export RCUTILS_COLORIZED_OUTPUT=1
  export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity}] {name}: {message}"
	export GAZEBO_RESOURCE_PATH="$GAZEBO_RESOURCE_PATH:$HOME/data/romea/gazebo"
	export GAZEBO_MODEL_PATH="$GAZEBO_MODEL_PATH:$HOME/data/romea/gazebo/models"
}

alias ccd="colcon_cd"
alias ccb="colcon build"
