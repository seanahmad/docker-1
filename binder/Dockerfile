#FROM jupyter/base-notebook:lab-2.1.3 as builder
FROM jupyter/minimal-notebook:6d42503c684f as builder

# copy the config file
COPY ./binder/jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

RUN pip install --no-cache-dir \
        pandas==1.0.5 \
        cvxpy==1.1.5 \
        plotly_express==0.4.1 \
        matplotlib==3.3.1 \
        scipy==1.5.2 && \
    fix-permissions /home/$NB_USER

# Basic JupyterLab renderer support
RUN jupyter labextension install jupyterlab-plotly@4.9.0

ENV PYTHONPATH "${PYTHONPATH}:/home/jovyan/python"