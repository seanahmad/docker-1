# Set the base image to beakerx
FROM jupyter/scipy-notebook:814ef10d64fb as jupyter

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@gmail.com"

# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

#RUN conda update -n base conda

#RUN conda config --set allow_conda_downgrades true
    #conda install conda=4.6.14 && \
    #conda config --env --add pinned_packages 'openjdk>8.0.121'

RUN conda install -y  -c conda-forge notebook=6.0.1 rise beakerx=1.4.1 && \
    conda clean -afy
    #&& find /opt/conda/ -follow -type f -name '*.a' -delete \
    #&& find /opt/conda/ -follow -type f -name '*.pyc' -delete \
    #&& find /opt/conda/ -follow -type f -name '*.js.map' -delete
    # statsmodels # && \
    #pip install --no-cache-dir git+http://github.com/lobnek/pyutil.git@4.0.1#egg=pyutil

ENV WORK=/home/jovyan/work


# ----------------------------------------------------------------------------------------
FROM jupyter as jupyterlab


RUN conda install -y -c conda-forge jupyterlab && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install beakerx-jupyterlab && \
    jupyter labextension install @jupyterlab/celltags && \
    jupyter lab build