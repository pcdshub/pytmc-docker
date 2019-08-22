FROM continuumio/miniconda3:4.3.27

LABEL maintainer="K Lauer <klauer@slac.stanford.edu>"
USER root

RUN echo "source activate pytmc" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

# --- Version settings
ENV PYTMC_VERSION      v2.0.0rc1
# --- Version settings

ADD pytmc_env.yml pytmc_env.yml
RUN conda create --name pytmc --file pytmc_env.yml
RUN pip install git+https://github.com/slaclab/pytmc.git@${PYTMC_VERSION}
RUN pip install git+https://github.com/epicsdeb/pypdb.git@4ad4016
