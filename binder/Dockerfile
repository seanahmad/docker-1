#FROM jupyter/base-notebook:lab-2.1.3 as builder
FROM jupyter/minimal-notebook:6d42503c684f as builder

# copy the config file
COPY ./binder/jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

#RUN conda config --add channels conda-forge && \
#    conda config --add channels plotly && \
#    conda config --add channels beakerx

#USER root


#RUN mkdir /var/lib/apt/lists/partial && \
#    apt-get update && \
#    apt-get install -y \
#        "g++" \
#        --no-install-recommends

#USER jovyan

RUN pip install --no-cache-dir \
        pandas==1.0.5 \
        cvxpy==1.1.5 \
        #beakerx==2.0.0 \
        #beakerx-tabledisplay==2.0.0 \
        #cufflinks==0.17.3 \
        plotly_express==0.4.1 \
        matplotlib==3.3.1 \
        scipy==1.5.2 && \
    fix-permissions /home/$NB_USER

#USER jovyan

#RUN conda install -c beakerx beakerx_kernel_autotranslation && \
#RUN conda install --channel beakerx beakerx_all && \
#    #beakerx_tabledisplay && \
#    #conda install -c beakerx beakerx_widgets && \
#    conda clean --all -f -y && \
#    fix-permissions $CONDA_DIR && \
#    fix-permissions /home/$NB_USER
#RUN conda install -y  \
        #pandas=1.0.5 \
        #cvxpy=1.1.2 \
#        python-cufflinks \
        #beakerx=2.0.0 \
#        plotly_express && \
#        matplotlib && \
#        scipy && \
    #conda clean --all -f -y && \
    #fix-permissions $CONDA_DIR && \
#    fix-permissions /home/$NB_USER

#USER jovyan
#ENV WORK=/home/jovyan/work

# beakerx won't work in the Lab but should work in the notebooks. Eliminate all beakerx from presentations
# please see https://github.com/twosigma/beakerx/issues/8264

# Basic JupyterLab renderer support
RUN jupyter labextension install jupyterlab-plotly@4.9.0
#--no-build && \
#    jupyter lab build && \
#
#    jupyter lab clean -y && \
#    npm cache clean --force && \
#    rm -rf /home/$NB_USER/.cache/yarn && \
#    rm -rf /home/$NB_USER/.node-gyp