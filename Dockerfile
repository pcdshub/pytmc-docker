FROM continuumio/miniconda3:4.7.10

LABEL maintainer="K Lauer <klauer@slac.stanford.edu>"
USER root

# For GL software rendering in pyqt GUIs
RUN apt update && \
    apt install libgl1-mesa-glx libxi6 -y

ENV PATH /opt/conda/envs/env/bin:$PATH

# --- Version settings
ENV PYTMC_VERSION      v2.0.0rc1
# --- Version settings

ADD pytmc_env.yml pytmc_env.yml

RUN pip install --upgrade pip
RUN conda config --add channels conda-forge
RUN conda install --channel conda-forge --file pytmc_env.yml

RUN pip install git+https://github.com/slaclab/pytmc.git@${PYTMC_VERSION}
RUN pip install git+https://github.com/epicsdeb/pypdb.git@4ad4016

ENTRYPOINT ["pytmc"]
