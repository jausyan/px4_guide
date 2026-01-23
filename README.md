## THIS IS GUIDE HOW TO RUN PX4 on Gazebo

1. step 1 : run px4 and gazebo
```sh
PX4_SIM_WORLD=arena_safmc make px4_sitl gazebo-classic_iris
```
2. run mavros
```bash
ros2 launch mavros px4.launch fcu_url:=udp://:14540@127.0.0.1:14557
```
3. make sure if the mavros sucessfuly connected to px4
```bash
ros2 topic echo /mavros/state
```

## HOW TO RUN ARENA SAFMC 2026
CARA 1: Langsung via command (PALING SIMPLE)
```bash
cd ~/px4_ws/PX4-Autopilot
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/ardupilot_gazebo/models
make px4_sitl gazebo-classic_iris PX4_SITL_WORLD=arena_safmc
```
CARA 2: Set environment variable dulu
```bash
cd ~/px4_ws/PX4-Autopilot
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/ardupilot_gazebo/models
export PX4_SITL_WORLD=arena_safmc
make px4_sitl gazebo-classic_iris
```