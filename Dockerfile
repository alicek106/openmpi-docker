# This Dockerfile will create OpenMPI Docker Image

FROM centos:7

# Install Dev Tools
RUN yum -y groupinstall "Development Tools"

# Get Latest OpenMPI Source code
RUN mkdir /tmp/git
WORKDIR /tmp/git
RUN git clone https://github.com/open-mpi/ompi.git

# Install OpenMPI
WORKDIR ompi
RUN ./autogen.pl && ./configure --prefix=/usr/local
RUN make && make install

# If you want create user, uncomment below lines
# RUN adduser -r -m ${USER} \
#      && echo "${USER}   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set User 
# USER ${USER}

