FROM ubuntu:18.04

RUN apt-get -y update && \ 
apt-get -y install casacore-dev libgsl-dev libhdf5-dev libfftw3-dev libboost-dev \
libboost-date-time-dev libboost-filesystem-dev libboost-program-options-dev \
libboost-system-dev libboost-thread-dev libcfitsio-dev cmake g++ git \ 
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& apt-get autoremove \
&& apt-get clean

WROKDIR /build

RUN git clone https://gitlab.com/aroffringa/wsclean.git &&
cd wsclean &&
git checkout -b trial 
&& cmake ../ 
&& make -j
&& make install

