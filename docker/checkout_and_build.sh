#!/bin/bash
WORKSPACE="$1"
ROSINSTALL_FILES="$2"
GITHUB_TOKEN="$3"

###

# anything you want to compile in user space


# cd $HOME

# source /opt/ros/noetic/setup.bash
# mkdir -p $WORKSPACE/src && cd $WORKSPACE/src && catkin_init_workspace

# cd $WORKSPACE/src

# wstool init
# for rif in "$ROSINSTALL_FILES"; do
#     wstool merge $rif
# done

# # checkout all repositories after injecting the GITHUB_TOKEN, and then remove the GITHUB_TOKEN immediately
# if [ "$GITHUB_TOKEN" ]; then
#     sed -i "s%https://github.com/%https://${GITHUB_TOKEN}@github.com/%" .rosinstall
# fi
# wstool update --continue-on-error -j 4
# rm -f .rosinstall

# rosdep install -y -i --from-paths .

# cd $WORKSPACE
# catkin_make_isolated --install

# clean up (optional to hide source code)
#rm -rf src build_* devel_*