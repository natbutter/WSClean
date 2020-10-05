
FROM ubuntu:20.04

ENV TZ 'UTC'
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \ 
apt-get -y install casacore-dev libgsl-dev libhdf5-dev libfftw3-dev libboost-dev python3-dev \
libboost-date-time-dev libboost-filesystem-dev libboost-program-options-dev \
libboost-system-dev libboost-thread-dev libcfitsio-dev cmake g++ git \
openmpi-bin libopenmpi-dev python3-dev python3-pybind11 python3-pip doxygen liblapack-dev \ 
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& apt-get autoremove \
&& apt-get clean

WORKDIR /workdir

RUN git clone https://gitlab.com/aroffringa/wsclean.git && \
cd wsclean && \
git checkout -b 923fd2baf598ffe488fb521b955f6eed3cc080 && \
mkdir build && cd build && \ 
cmake ../ && \
make && \
make install

