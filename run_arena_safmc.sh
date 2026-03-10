cd ~/px4_ws/PX4-Autopilot
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/ardupilot_gazebo/models
export PX4_SITL_WORLD=arena_safmc
make px4_sitl gazebo-classic_iris