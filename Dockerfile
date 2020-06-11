FROM jupyter/base-notebook:lab-2.1.3

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@gmail.com"

# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

USER root

# Install git
RUN apt-get update && apt-get install -yq --no-install-recommends git gcc  && apt-get clean

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

RUN conda install -y  -c conda-forge pandas=0.25.3 cvxpy=1.0.31 python-cufflinks matplotlib && conda clean -afy

# install beakerx
RUN conda install -y -c conda-forge beakerx=1.4.1 && \
    jupyter labextension install beakerx-jupyterlab --no-build

RUN jupyter lab build --minimize=False

ENV WORK=/home/jovyan/work