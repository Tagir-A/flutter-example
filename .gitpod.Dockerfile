FROM gitpod/workspace-full

ENV FLUTTER_HOME=/home/gitpod/flutter \
    FLUTTER_VERSION=2.0.5-stable

USER gitpod

# Install Flutter sdk
RUN cd /home/gitpod && \
  wget -qO flutter_sdk.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz && \
  tar -xvf flutter_sdk.tar.xz && rm flutter_sdk.tar.xz

# Install chromium
# RUN sudo apt-get -q update && \
#     sudo apt-get install -yq chromium-browser && \
#     sudo rm -rf /var/lib/apt/lists/*
    
# Change the PUB_CACHE to /workspace so dependencies are preserved.
ENV PUB_CACHE=/workspace/.pub_cache

# add executables to PATH
RUN echo 'export PATH=${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin:${PUB_CACHE}/bin:${FLUTTER_HOME}/.pub-cache/bin:$PATH' >>~/.bashrc

# Set chromium as chrome
# RUN echo 'export CHROME_EXECUTABLE=/usr/bin/chromium-browser' >>~/.bashrc