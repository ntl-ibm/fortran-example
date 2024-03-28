ARG ROOT_CONTAINER=quay.io/almalinux/almalinux:8.9
FROM $ROOT_CONTAINER
LABEL maintainer="Nick Lawrence ntl@us.ibm.com"

# https://stackoverflow.com/questions/58424974/anaconda-importerror-usr-lib64-libstdc-so-6-version-glibcxx-3-4-21-not-fo
ENV LD_LIBRARY_PATH=${CONDA_DIR}/lib

## OS Dependencies
RUN dnf group -y install "Development Tools" \
    && dnf clean all && rm -rf /var/cache/dnf/* && rm -rf /var/cache/yum

WORKDIR /app

# Add Source
WORKDIR /hello-world-src
COPY *.f90 .

# Compile program
RUN gfortran hello-world.f90 -o /app/hello-world

WORKDIR /app
RUN chmod g+rx hello-world-app

ENTRYPOINT [ "hello-world-app" ]