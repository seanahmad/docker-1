FROM jupyter/scipy-notebook:814ef10d64fb

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@gmail.com"

# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py


RUN conda install -y  -c conda-forge notebook=6.0.1 rise beakerx=1.4.1 jupyterlab && \
    conda clean -afy && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install beakerx-jupyterlab && \
    jupyter labextension install @jupyterlab/celltags && \
    jupyter lab build

ENV WORK=/home/jovyan/work