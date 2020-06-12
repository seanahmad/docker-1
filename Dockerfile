#FROM jupyter/base-notebook:lab-2.1.3 as builder
FROM jupyter/minimal-notebook:76402a27fd13 as builder

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@gmail.com"

# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

RUN conda config --add channels conda-forge && \
    conda config --add channels plotly

RUN conda install -y  \
        pandas=0.25.3 \
        cvxpy=1.0.31 \
        python-cufflinks \
        beakerx=1.4.1 \
        plotly_express && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

#RUN git clone https://github.com/twosigma/beakerx.git /tmp/beakerx && \
#    pip install /tmp/beakerx/beakerx && \
#    beakerx install

ENV WORK=/home/jovyan/work

# please see https://github.com/twosigma/beakerx/issues/8264

#FROM builder as beakerx

# install beakerx
#RUN conda install -y -c conda-forge beakerx=1.4.1 && \
#    conda clean --all -f -y && \
#    fix-permissions $CONDA_DIR && \
#    fix-permissions /home/$NB_USER

#&& \
#    jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build && \
#    jupyter labextension install beakerx-jupyterlab --no-build

#RUN jupyter lab build && \
#    jupyter lab clean -y && \
#    npm cache clean --force && \
#    rm -rf /home/$NB_USER/.cache/yarn && \
#    rm -rf /home/$NB_USER/.node-gyp

# --minimize=False --dev-build=False