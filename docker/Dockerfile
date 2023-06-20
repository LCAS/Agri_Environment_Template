ARG BASE_IMAGE="lcas.lincoln.ac.uk/lcas/kasm-desktop-ros-noetic:develop" 
FROM $BASE_IMAGE AS builder
ARG GITHUB_TOKEN
ARG WORKSPACE="workspace"
ENV WORKSPACE="$HOME/${WORKSPACE}"

# switch to root user

COPY install.sh /tmp/install.sh

USER 0
# run relevant root commands here
RUN apt-get update
RUN bash /tmp/install.sh

# switch back to non-root user
USER 1000
WORKDIR $HOME
RUN bash -c "source /opt/ros/noetic/setup.bash; rosdep update"

# copy the main rosinstall file
COPY checkout_and_build.sh /tmp/checkout_and_build.sh

RUN bash /tmp/checkout_and_build.sh ${WORKSPACE} "some argument" "${GITHUB_TOKEN}"

WORKDIR $WORKSPACE

########### NOW BUILD THE ACTUAL FINAL IMAGE (not the builder)

# FROM $BASE_IMAGE AS install
# USER 1000
# WORKDIR $HOME
# RUN mkdir -p $WORKSPACE
# WORKDIR $WORKSPACE
# COPY --from=builder $WORKSPACE/install_isolated $WORKSPACE/install_isolated 

ENTRYPOINT ["/dockerstartup/kasm_default_profile.sh", "/dockerstartup/vnc_startup.sh", "/dockerstartup/kasm_startup.sh"]
CMD ["--wait"]
