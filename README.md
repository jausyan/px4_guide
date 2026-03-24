## THIS IS GUIDE HOW TO RUN PX4 on Gazebo
by El jausyan

1. step 1 : run px4 and gazebo
```sh
cd ~/px4_ws/PX4-Autopilot
PX4_SIM_WORLD=arena_safmc make px4_sitl gazebo-classic_iris
```
```sh
make px4_sitl gazebo-classic_iris
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
Method 1 : Directly run from terminal
```bash
cd ~/px4_ws/PX4-Autopilot
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/ardupilot_gazebo/models
make px4_sitl gazebo-classic_iris PX4_SITL_WORLD=arena_safmc
```
Method 2 : Set environment
```bash
cd ~/px4_ws/PX4-Autopilot
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/ardupilot_gazebo/models
export PX4_SITL_WORLD=arena_safmc
make px4_sitl gazebo-classic_iris
```

## How to run Swarm 2 Drone
1. First go to PX4 Workspace
```sh
cd ~/px4_ws/PX4-Autopilot
``` 
2. Launch dual Drone world File
```sh
./Tools/simulation/gazebo-classic/sitl_multiple_run.sh -n 2 -m iris -w empty
```
This will spawn dual drone, if you want to spawn more drone you can adjust the flag <b>-n </b> followed by how many drone you want to spawn

3. Run mavros for Drone 1 "uav1"
```sh
ros2 run mavros mavros_node --ros-args -r __ns:=/uav1 -p fcu_url:=udp://:14541@localhost:14581 -p tgt_system:=2
``` 
4. Run mavros for Drone 2 "uav2"
```sh
ros2 run mavros mavros_node --ros-args -r __ns:=/uav2 -p fcu_url:=udp://:14542@localhost:14582 -p tgt_system:=3
```
5. Run mavros for Drone 3 "uav3"
```sh
ros2 run mavros mavros_node --ros-args -r __ns:=/uav3 -p fcu_url:=udp://:14543@localhost:14583 -p tgt_system:=4
```