source_tiara() {
	source ~/projects/ros/tiara_workspace/devel/setup.zsh
	export ROSCONSOLE_FORMAT='[${severity}] ${node}: ${message}'
	export GAZEBO_RESOURCE_PATH="$HOME/data/tiara/gazebo:$HOME/data/romea/gazebo"
	export GAZEBO_MODEL_PATH="$HOME/data/tiara/gazebo/models:$HOME/data/romea/gazebo/models"
}

source_tiara2() {
  unset ROS_DISTRO
  source /opt/ros/galactic/setup.zsh
  source ~/projects/ros/tiara_ros2/install/local_setup.zsh
  source /usr/share/colcon_cd/function/colcon_cd.sh
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
  export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity}] {name}: {message}"
	export GAZEBO_RESOURCE_PATH="$HOME/data/tiara/gazebo:$HOME/data/romea/gazebo"
	export GAZEBO_MODEL_PATH="$HOME/data/tiara/gazebo/models:$HOME/data/romea/gazebo/models"
  export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
}

source_ros2() {
  unset ROS_DISTRO
  source /opt/ros/jazzy/setup.zsh
  source /usr/share/colcon_cd/function/colcon_cd.sh
  source /usr/share/colcon_cd/function/colcon_cd-argcomplete.zsh
  source <(register-python-argcomplete ros2)
  source <(register-python-argcomplete colcon)
  export ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST
  export RCUTILS_COLORIZED_OUTPUT=1
  export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity}] {name}: {message}"
}

source_tirrex() {
  unset ROS_DISTRO
  source /usr/share/gazebo/setup.sh
  source /opt/ros/galactic/setup.zsh
  source ~/projects/ros/tirrex_ws/install/local_setup.zsh
  source /usr/share/colcon_cd/function/colcon_cd.sh
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
  export RCUTILS_COLORIZED_OUTPUT=1
  export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity}] {name}: {message}"
	export GAZEBO_RESOURCE_PATH="$GAZEBO_RESOURCE_PATH:$HOME/data/romea/gazebo"
	export GAZEBO_MODEL_PATH="$GAZEBO_MODEL_PATH:$HOME/data/romea/gazebo/models"
}

alias ccd="colcon_cd"
alias ccb="colcon build --symlink-install"

export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI='<CycloneDDS><Domain><General><Interfaces><NetworkInterface name="lo" multicast="true"/></Interfaces></General><Discovery><ParticipantIndex>none</ParticipantIndex></Discovery></Domain></CycloneDDS><Gen><Allow>spdp</Allow></Gen>'
